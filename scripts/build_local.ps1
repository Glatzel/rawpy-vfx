Set-Location $PSScriptRoot
Set-Location ..
$env:USE_CONDA = '1'
$env:PYTHON_ARCH = 'x86_64'

# clone rawpy
Remove-Item rawpy -Recurse -Force -ErrorAction SilentlyContinue
git clone https://github.com/letmaik/rawpy.git --depth 1

# install vcpkg dependency
vcpkg install zlib libjpeg-turbo[jpeg8] jasper lcms --triplet=x64-windows-static --recurse
$env:CMAKE_PREFIX_PATH = Resolve-Path "./vcpkg/installed/x64-windows-static"

# build rawpy
# Set-Location rawpy
# git apply ../numpy_require.patch
# pixi run -e vfx2024 python -u setup.py bdist_wheel
