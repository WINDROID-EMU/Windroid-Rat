#!/bin/bash
customDxvkDownload() {
	if [ -e "DXVK/$1" ]; then
		echo "$1 already downloaded."
	else
		echo "Downloading DXVK-$1..."

		cd "DXVK"

		curl -# -L -O "$3"

		if [ $? != 0 ]; then
			echo "Error on Downloading DXVK-$1."
		else
			mkdir -p "dxvk/files"

			tar -xf "$(basename $3)"

			mv "dxvk"*"/x32" "dxvk"*"/x64" "dxvk/files"

			$INIT_DIR/create-rat-pkg.sh "DXVK" "DXVK" "" "any" "$1-$2" "DXVK" "dxvk" "$INIT_DIR/components/DXVK"

			rm -rf "dxvk"*
		fi

		cd "$OLDPWD"
	fi
}

dxvkDownload() {
	if [ -e "DXVK/DXVK-$1" ]; then
		echo "DXVK-$1 already downloaded."
	else
		echo "Downloading DXVK-$1..."

		cd "DXVK"

		curl -# -L -O "https://github.com/doitsujin/dxvk/releases/download/v$1/dxvk-$1.tar.gz"

		if [ $? != 0 ]; then
			echo "Error on Downloading DXVK-$1."
		else
			mkdir -p "dxvk/files"

			tar -xf "dxvk-$1.tar.gz"

			mv "dxvk"*"/x32" "dxvk"*"/x64" "dxvk/files"

			$INIT_DIR/create-rat-pkg.sh "DXVK" "DXVK" "" "any" "$1" "DXVK" "dxvk" "$INIT_DIR/components/DXVK"

			rm -rf "dxvk"*
		fi

		cd "$OLDPWD"
	fi
}

dxvkAsyncDownload() {
	if [ -e "DXVK/DXVK-$1-async" ]; then
		echo "DXVK-$1-async already downloaded."
	else
		echo "Downloading DXVK-$1-async..."

		cd "DXVK"

		curl -# -L -O "https://github.com/Sporif/dxvk-async/releases/download/$1/dxvk-async-$1.tar.gz"

		if [ $? != 0 ]; then
			echo "Error on Downloading DXVK-$1-async."
		else
			mkdir -p "dxvk/files"

			tar -xf "dxvk-async-$1.tar.gz"

			mv "dxvk"*"/x32" "dxvk"*"/x64" "dxvk/files"

			$INIT_DIR/create-rat-pkg.sh "DXVK" "DXVK" "" "any" "$1-async" "DXVK" "dxvk" "$INIT_DIR/components/DXVK"

			rm -rf "dxvk"*
		fi

		cd "$OLDPWD"
	fi
}

dxvkGplAsyncDownload() {
	if [ -e "DXVK/DXVK-$1-gplasync" ]; then
		echo "DXVK-$1-gplasync already downloaded."
	else
		echo "Downloading DXVK-$1-gplasync..."

		cd "DXVK"

		curl -# -L -O "https://github.com/KreitinnSoftware/dxvk-gplasync/raw/refs/heads/main/dxvk-gplasync-v$1.tar.gz"

		if [ $? != 0 ]; then
			echo "Error on Downloading DXVK-$1-gplasync."
		else
			mkdir -p "dxvk/files"

			tar -xf "dxvk-gplasync-v$1.tar.gz"

			mv "dxvk"*"/x32" "dxvk"*"/x64" "dxvk/files"

			$INIT_DIR/create-rat-pkg.sh "DXVK" "DXVK" "" "any" "$1-gplasync" "DXVK" "dxvk" "$INIT_DIR/components/DXVK"

			rm -rf "dxvk"*
		fi

		cd "$OLDPWD"
	fi
}

wined3dDownload() {
	if [ -e "WineD3D/WineD3D-($1)" ]; then
		echo "WineD3D-$1 already downloaded."
	else
		echo "Downloading WineD3D-$1..."

		cd "WineD3D"

		curl -# -L -O "https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_$1.zip"
		curl -# -L -O "https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_$1-x86_64.zip"

		if [ $? != 0 ]; then
			echo "Error on Downloading WineD3D-($1)."
		else
			mkdir -p "wined3d/files/x64"
			mkdir -p "wined3d/files/x32"

			7z x "WineD3D*$1-x86_64.zip" -o"wined3d-x64" -aoa &> /dev/zero
			7z x "WineD3D*$1.zip" -o"wined3d-x32" -aoa &> /dev/zero

			for i in $(find "wined3d-x64" -name "*.dll"); do
				cp -f "$i" "wined3d/files/x64"
			done

			for i in $(find "wined3d-x32" -name "*.dll"); do
				cp -f "$i" "wined3d/files/x32"
			done

			$INIT_DIR/create-rat-pkg.sh "WineD3D" "WineD3D" "" "any" "$1" "WineD3D" "wined3d" "$INIT_DIR/components/WineD3D"

			rm -rf "wined3d"* *".zip"
		fi

		cd "$OLDPWD"
	fi
}

vkd3dDownload() {
	if [ -e "VKD3D/VKD3D-$1" ]; then
		echo "VKD3D-$1 already downloaded."
	else
		cd "VKD3D"

		echo "Downloading VKD3D-$1..."

		curl -# -L -O "https://github.com/HansKristian-Work/vkd3d-proton/releases/download/v$1/vkd3d-proton-$1.tar.zst"

		if [ $? != 0 ]; then
			echo "Error on Downloading VKD3D-$1."
		else
			mkdir -p "vkd3d/files"

			tar -xf "vkd3d-proton-$1.tar.zst"

			mv "vkd3d"*"/x64" "vkd3d/files/"
			mv "vkd3d"*"/x86" "vkd3d/files/x32"

			$INIT_DIR/create-rat-pkg.sh "VKD3D" "VKD3D" "" "any" "$1" "VKD3D" "vkd3d" "$INIT_DIR/components/VKD3D"

			rm -rf "vkd3d"*
		fi

		cd "$OLDPWD"
	fi
}

export INIT_DIR="$PWD"
export WORKDIR="$PWD/components"

mkdir -p "$WORKDIR"

cd "$WORKDIR"

mkdir -p "DXVK" "WineD3D" "VKD3D"

export DXVK_GPLASYNC_LIST="2.4-1 2.3.1-1 2.3-1 2.2-4 2.1-4"
export DXVK_ASYNC_LIST="2.0 1.10.3 1.10.2 1.10.1 1.10 1.9.4 1.9.3 1.9.2 1.9.1 1.9"
export DXVK_LIST="2.5.3 2.5.2 2.5.1 2.5 2.4.1 2.4 2.3.1 2.3 2.2 2.1 2.0 1.10.3 1.10.2 1.10.1 1.10 1.9.4 1.9.3 1.9.2 1.9.1 1.9 1.7.2 1.7.1 1.7 1.7.3"
export WINED3D_LIST="10.0 10.0-rc3 9.20 9.16 9.3 9.1 9.0 8.15 7.11 3.17"
export VKD3D_LIST="2.14.1 2.14 2.13 2.12 2.11.1 2.11 2.10 2.9 2.8"

for i in $DXVK_GPLASYNC_LIST; do
	dxvkGplAsyncDownload "$i"
done

for i in $DXVK_ASYNC_LIST; do
	dxvkAsyncDownload "$i"
done

for i in $DXVK_LIST; do
	dxvkDownload "$i"
done

for i in $WINED3D_LIST; do
	wined3dDownload "$i"
done

for i in $VKD3D_LIST; do
	vkd3dDownload "$i"
done

customDxvkDownload "1.10" "Stripped-Requirements" "https://github.com/KreitinnSoftware/dxvk/releases/download/dxvk-1.10-stripped-requirements/dxvk-1.10-b3e85be0fcef978604656a19ecafdde85a28326a.tar.gz"
customDxvkDownload "1.10.6" "Sarek-Stripped-Requirements" "https://github.com/KreitinnSoftware/dxvk-gplasync/raw/refs/heads/main/dxvk-sarek-stripped.tar.gz"
customDxvkDownload "1.10.6" "Sarek" "https://github.com/pythonlover02/DXVK-Sarek/releases/download/v1.10.6/dxvk-sarek-v1.10.6.tar.gz"
customDxvkDownload "1.10.6" "Sarek-ASync" "https://github.com/pythonlover02/DXVK-Sarek/releases/download/v1.10.6/dxvk-sarek-async-v1.10.6.tar.gz"
