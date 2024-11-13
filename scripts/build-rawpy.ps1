Set-Location $PSScriptRoot
Set-Location ..

# clone rawpy
git clone https://github.com/letmaik/rawpy.git --depth 1

# install vcpkg dependency
$triplet=Resolve-Path ./triplet
vcpkg install --triplet=x64-windows-static --overlay-triplets=$triplet --recurse

# build
$env:CMAKE_PREFIX_PATH = Resolve-Path "./vcpkg_installed/x64-windows-static"
Set-Location rawpy
../scripts/init-vs.ps1
git apply ../numpy_require.patch
pixi run -e vfx2024 python -u setup.py bdist_wheel