#!/bin/bash
##zlib/[1.3.1]
##libjpeg/9e
##libpng/[1.6.43]
##freetype/[~2.13.2]
##spdlog/[~1.13]
##protobuf/[~3.21.12]
##libiconv/1.17
##eigen/[3.4.0]
##dlib/[19.23.2]
##geos/[3.12.0]
##glog/0.7.0
##gtest/1.14.0
##ceres-solver/2.2.0
##quazip/[~1.4]
##libusb/1.0.26
##cereal/1.2.2
##glm/0.9.9.8
##nanoflann/[~1.5]
##cryptopp/8.9.0
##openssl/1.1.1
##boost/1.77
##opencv/[~3.4]
#
#git mkdir conan-center-index
#cd conan-center-index
#git init
#git remote add origin https://github.com/conan-io/conan-center-index.git
#
#git config --worktree add core.sparseCheckout true
##git config --worktree add core.sparseCheckoutCone true
#git config --worktree add index.sparse true
#git sparse-checkout set \
#recipes/zlib/all \
#recipes/libjpeg/all \
#recipes/libpng/all \
#recipes/freetype/all \
#recipes/spdlog/all \
#recipes/protobuf/all \
#recipes/libiconv/all \
#recipes/eigen/all \
#recipes/dlib/all \
#recipes/geos/all \
#recipes/glog/all \
#recipes/gtest/all \
#recipes/ceres-solver/all \
#recipes/quazip/all \
#recipes/libusb/all \
#recipes/cereal/all \
#recipes/glm/all \
#recipes/nanoflann/all \
#recipes/cryptopp/all \
#recipes/openssl/all \
#recipes/boost/all \
#recipes/opencv/3.x 



#
#bck-i-search: sparse-checkout _
PROFILE=gcc9-release
# fPIC and shared are mutually exclusive
OPTIONS="-o shared=True -o fPIC=False"
ZLIB_VERSION=1.3.1
LIBJPEG_VERSION=9e
ROOTDIR=$(pwd)
REMOTE=gitea
cd ${ROOTDIR}/recipes/zlib/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${ZLIB_VERSION}
conan upload --remote=${REMOTE} zlib/${ZLIB_VERSION}

# Libjpeg
cd ${ROOTDIR}/recipes/libjpeg/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${LIBJPEG_VERSION}
conan upload --remote=${REMOTE} libjpeg/${LIBJPEG_VERSION}

# LIBPNG
LIBPNG_VERSION=1.6.43
cd ${ROOTDIR}/recipes/libpng/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${LIBPNG_VERSION}
conan upload --remote=${REMOTE} libpng/${LIBPNG_VERSION}

# Freetype
VERSION=2.13.2
LIB=freetype
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --build=zlib/${ZLIB_VERSION} --build=libpng/${LIBPNG_VERSION} --build=freetype/${VERSION} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

# spdlog
#VERSION=2.13.0
#LIB=spdlog
#cd ${ROOTDIR}/recipes/${LIB}/all
#conan create . --profile=${PROFILE} ${OPTIONS}  --version=${VERSION}
#conan upload --remote=${REMOTE} ${LIB}/${VERSION}

# LibIconv
# Freetype
VERSION=1.17
LIB=libiconv
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}


####################################################
#Protobuf
VERSION=3.21.12
LIB=protobuf
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Eigen
VERSION=3.4.0
LIB=eigen
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Dlib
VERSION=19.23.2
LIB=dlib
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} -o with_gif=False -o with_webp=False -o with_sqlite3=False -o with_openblas=False \
--version=${VERSION} --build=libjpeg/${LIBJPEG_VERSION} --build=libpng/${LIBPNG_VERSION} --build=zlib/${ZLIB_VERSION} \
--build=dlib/${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Geos
VERSION=3.12.0
LIB=geos
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Glog
VERSION=0.7.0
LIB=glog
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} -o with_gflags=False -o with_unwind=False --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Gtest
VERSION=1.14.0
LIB=gtest
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Ceres-solver
VERSION=2.2.0
LIB=ceres-solver
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Quazip
VERSION=1.4.0
LIB=quazip
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Libusb
VERSION=1.0.26
LIB=libusb
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Cereal
VERSION=1.2.2
LIB=cereal
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Glm
VERSION=0.9.9.8
LIB=glm
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}

#Nanoflann
VERSION=1.5.0
LIB=nanoflann
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Cryptopp
VERSION=8.9.0
LIB=cryptopp
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Openssl
VERSION=1.1.1w
LIB=openssl
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}
nd
#Boost
VERSION=1.77.0
LIB=boost
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}

#Opencv
VERSION=3.4.20
LIB=opencv
cd ${ROOTDIR}/recipes/${LIB}/3.x
conan create . --profile=${PROFILE} ${OPTIONS} -o parallel="openmp" -o with_tiff=False -o contrib=False -o with_jasper=False \
-o with_webp=False -o with_gtk=False -o nonfree=True -o with_openexr=False -o with_jpeg=libjpeg \
--version=${VERSION} --build=libjpeg/9e --build=libpng/${LIBPNG_VERSION} --build=opencv/3.4.20
conan upload --remote=${REMOTE} ${LIB}/${VERSION}



#dcmtk
VERSION=3.6.6
LIB=dcmtk
cd ${ROOTDIR}/recipes/${LIB}/all
conan create . --profile=${PROFILE} ${OPTIONS} --version=${VERSION}
conan upload --remote=${REMOTE} ${LIB}/${VERSION}


#Qt 5.15.12
# This one is a righteous pain in the butt
conan create . --profile=gcc9-release --version=5.15.12 -o shared=True  --build=missing -o with_x11=False -o qtwayland=False
conan upload --remote=${REMOTE} qt/5.15.12
