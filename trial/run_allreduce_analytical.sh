#! /bin/bash -v

# Absolue path to this script
ASTRASIM="/nethome/dkadiyala3/astra-sim-roofline"

# Absolute paths to useful directories
BINARY="${ASTRASIM}/build/astra_analytical/build/AnalyticalAstra/bin/AnalyticalAstra"
## NETWORK="./sample_Torus3D.json"
## SYSTEM="./sample_torus_sys.txt"
##WORKLOAD="./Transformer_HybridParallel_Fwd_In_Bckwd.txt"

NETWORK="./dgx-2.json"
SYSTEM="./dgx-2.txt"
WORKLOAD="./validation-microbenchmark.txt"
STATS="./astra_allreduce_analytical"

rm -rf "${STATS}"
mkdir "${STATS}"

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD}" \
--path="${STATS}/" \
--run-name="Transformer_HybridParallel" \
--num-passes=10 \
--total-stat-rows=1 \
--stat-row=0 
#--comm-scale=50 \
