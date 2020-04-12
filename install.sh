!/bin/bash

cd llvm-10.0.0.src/

mkdir build
cd build

cmake .. -DMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_PREFIX_PATH=/usr/local -DCMAKE_BUILD_TYPE=Release -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="AVR" -DLLVM_ENABLE_LIBXML2=OFF
make install

cd ..

cd lld-10.0.0.src/

mkdir build
cd build

cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_PREFIX_PATH=/usr/local -DCMAKE_BUILD_TYPE=Release
make install

cd ..

cd clang-10.0.0.src/

mkdir build
cd build

cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_PREFIX_PATH=/usr/local -DCMAKE_BUILD_TYPE=Release
make install

cd ..
