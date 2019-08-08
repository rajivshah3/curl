#!/bin/sh

#export CC=clang ./bench_arm.sh
export PCURL_DEBUG=OFF

mkdir .build_${CC}_neon_orn_opt
cd .build_${CC}_neon_orn_opt
cmake -G "Unix Makefiles" -DPCURL_DEBUG=$PCURL_DEBUG -DPTRIT_PLATFORM=PTRIT_NEON -DPTRIT_CVT=PTRIT_CVT_ORN -DPCURL_SBOX=PCURL_SBOX_OPT ..
make
./pcurl > pcurl.log
cd ..

mkdir .build_${CC}_neon_orn_mem2x
cd .build_${CC}_neon_orn_mem2x
cmake -G "Unix Makefiles" -DPCURL_DEBUG=$PCURL_DEBUG -DPTRIT_PLATFORM=PTRIT_NEON -DPTRIT_CVT=PTRIT_CVT_ORN -DPCURL_SBOX=PCURL_SBOX_MEM2X ..
make
./pcurl > pcurl.log
cd ..

mkdir .build_${CC}_64_orn_opt
cd .build_${CC}_64_orn_opt
cmake -G "Unix Makefiles" -DPCURL_DEBUG=$PCURL_DEBUG -DPTRIT_PLATFORM=PTRIT_64 -DPTRIT_CVT=PTRIT_CVT_ORN -DPCURL_SBOX=PCURL_SBOX_OPT ..
make
./pcurl > pcurl.log
cd ..

mkdir .build_${CC}_64_andn_opt
cd .build_${CC}_64_andn_opt
cmake -G "Unix Makefiles" -DPCURL_DEBUG=$PCURL_DEBUG -DPTRIT_PLATFORM=PTRIT_64 -DPTRIT_CVT=PTRIT_CVT_ANDN -DPCURL_SBOX=PCURL_SBOX_OPT ..
make
./pcurl > pcurl.log
cd ..

mkdir .build_${CC}_64_andn_mem2x
cd .build_${CC}_64_andn_mem2x
cmake -G "Unix Makefiles" -DPCURL_DEBUG=$PCURL_DEBUG -DPTRIT_PLATFORM=PTRIT_64 -DPTRIT_CVT=PTRIT_CVT_ANDN -DPCURL_SBOX=PCURL_SBOX_MEM2X ..
make
./pcurl > pcurl.log
cd ..

mkdir .build_${CC}_64_andn_index
cd .build_${CC}_64_andn_index
cmake -G "Unix Makefiles" -DPCURL_DEBUG=$PCURL_DEBUG -DPTRIT_PLATFORM=PTRIT_64 -DPTRIT_CVT=PTRIT_CVT_ANDN -DPCURL_SBOX=PCURL_SBOX_INDEX ..
make
./pcurl > pcurl.log
cd ..

find . -name pcurl.log -print -exec tail -n 3 {} \;
