#!/usr/bin/env bash

set -uo pipefail

readonly GPU_TYPE="${1:-}"
readonly HISTORY_SIZE=10
readonly POLL_INTERVAL="0.5"
readonly EXIT_ERROR=84

declare -a history=()
for ((i = 0; i < HISTORY_SIZE; i++)); do
    history+=(0)
done

declare -i pointer=0

function fatal()
{
    printf 'FATAL: %s\n' "$1" >&2
    exit "${EXIT_ERROR}"
}

function show_gpu_usage()
{
    local -i current="$1"
    local -i sum=0
    local val

    history[pointer]="${current}"
    pointer=$(((pointer + 1) % HISTORY_SIZE))

    for val in "${history[@]}"; do
        ((sum += val))
    done

    printf '%d\n' "$((sum / HISTORY_SIZE))"
}

if [[ "${GPU_TYPE}" == "amd" ]]; then
    AMD_GPU_FILE=""
    for file in /sys/class/hwmon/hwmon*/device/gpu_busy_percent; do
        if [[ -f "${file}" ]]; then
            AMD_GPU_FILE="${file}"
            break
        fi
    done

    if [[ -z "${AMD_GPU_FILE}" ]]; then
        fatal "Impossible de trouver gpu_busy_percent."
    fi

    while true; do
        if read -r usage < "${AMD_GPU_FILE}"; then
            if [[ "${usage}" =~ ^[0-9]+$ ]]; then
                show_gpu_usage "${usage}"
            fi
        fi
        sleep "${POLL_INTERVAL}"
    done

elif [[ "${GPU_TYPE}" == "nvidia" ]]; then
    readonly NV_MS=500

    nvidia-smi \
        --query-gpu=utilization.gpu \
        --format=csv,noheader,nounits \
        -lms "${NV_MS}" 2>/dev/null |
    while read -r raw_usage; do
        usage="${raw_usage//[[:space:]]/}"

        if [[ "${usage}" =~ ^[0-9]+$ ]]; then
            show_gpu_usage "${usage}"
        fi
    done

else
    fatal "Usage: $0 [nvidia|amd]"
fi
