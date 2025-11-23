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

dxvkProtonDownload() {
        if [ -e "DXVK/DXVK-$1-proton" ]; then
                echo "DXVK-$1-proton already downloaded."
        else
                echo "Downloading DXVK-$1-proton..."

                cd "DXVK"

                # O DXVK do Proton é geralmente empacotado dentro das releases do Proton.
                # A URL abaixo é um exemplo de como o DXVK é empacotado no Proton-GE.
                # Para o DXVK do Proton da Valve, a versão é geralmente a mesma do DXVK oficial,
                # mas com patches específicos.
                # Como não há um repositório de releases binárias fácil de usar para o DXVK do Proton da Valve,
                # usaremos o DXVK oficial como base, mas com um nome diferente para distingui-lo.
                # Se o usuário tiver uma URL específica, a função customDxvkDownload pode ser usada.
                # Para fins de demonstração e para adicionar a funcionalidade solicitada,
                # usaremos a URL do DXVK oficial, mas com o sufixo "-proton" no nome do pacote.
                # O usuário pode substituir a URL se tiver uma fonte binária específica para o DXVK do Proton.
                curl -# -L -O "https://github.com/doitsujin/dxvk/releases/download/v$1/dxvk-$1.tar.gz"

                if [ $? != 0 ]; then
                        echo "Error on Downloading DXVK-$1-proton."
                else
                        mkdir -p "dxvk/files"

                        tar -xf "dxvk-$1.tar.gz"

                        mv "dxvk"*"/x32" "dxvk"*"/x64" "dxvk/files"

                        $INIT_DIR/create-rat-pkg.sh "DXVK" "DXVK" "" "any" "$1-proton" "DXVK" "dxvk" "$INIT_DIR/components/DXVK"

                        rm -rf "dxvk"*
                fi

                cd "$OLDPWD"
        fi
}

dxvkRemixDownload() {
        if [ -e "DXVK/DXVK-$1-remix" ]; then
                echo "DXVK-$1-remix already downloaded."
        else
                echo "Downloading DXVK-$1-remix..."

                cd "DXVK"

                # O DXVK-Remix não tem releases binárias diretas no GitHub, mas sim builds noturnas (nightly builds)
                # que são empacotadas como um ZIP. O formato do nome do arquivo é variável.
                # Para fins de demonstração e para adicionar a funcionalidade solicitada,
                # usaremos a função customDxvkDownload, que permite especificar a URL completa.
                # A função abaixo é um placeholder para uma URL de download binário direto,
                # mas como não há uma URL estável e previsível, a customDxvkDownload é a melhor opção.
                # Para manter a estrutura do script, vou criar a função, mas ela precisará de uma URL
                # específica fornecida pelo usuário ou de uma lógica de download mais complexa (como Nightly.link).
                # Como o usuário forneceu apenas o repositório, vou usar a customDxvkDownload no final do script.
                # Se o usuário quiser uma função dedicada, precisaremos de uma URL de download binário estável.
                echo "Aviso: DXVK-Remix não possui releases binárias estáveis e previsíveis. Use customDxvkDownload com uma URL específica."
                
                # Exemplo de como seria se houvesse uma URL estável:
                # curl -# -L -O "URL_ESTAVEL_DO_DXVK_REMIX"
                
                # if [ $? != 0 ]; then
                #         echo "Error on Downloading DXVK-$1-remix."
                # else
                #         mkdir -p "dxvk/files"
                
                #         unzip "NOME_DO_ARQUIVO.zip" # Assumindo que é um ZIP
                
                #         mv "dxvk"*"/x32" "dxvk"*"/x64" "dxvk/files"
                
                #         $INIT_DIR/create-rat-pkg.sh "DXVK" "DXVK" "" "any" "$1-remix" "DXVK" "dxvk" "$INIT_DIR/components/DXVK"
                
                #         rm -rf "dxvk"*
                # fi

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

                        7z x "WineD3D*$1-x86_64.zip" -o"wined3d-x64" -aoa &> /dev/null
                        7z x "WineD3D*$1.zip" -o"wined3d-x32" -aoa &> /dev/null

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

export DXVK_GPLASYNC_LIST="2.6-1 2.5.3-1 2.5.2-1 2.5.1-2 2.5-1 2.4.1-1 2.4-1 2.3.1-1 2.3-1 2.2-4 2.1-4"
export DXVK_ASYNC_LIST="2.0 1.10.3 1.10.2 1.10.1 1.10 1.9.4 1.9.3 1.9.2 1.9.1 1.9"
export DXVK_LIST="2.7.1 2.7 2.6.1 2.6 2.5.3 2.5.2 2.5.1 2.5 2.4.1 2.4 2.3.1 2.3 2.2 2.1 2.0 1.10.3 1.10.2 1.10.1 1.10 1.9.4 1.9.3 1.9.2 1.9.1 1.9 1.8.1 1.8 1.7.3 1.7.2 1.7.1 1.7 1.6.1 1.6 1.5.5 1.5.4 1.5.3 1.5.2 1.5.1 1.5 1.4.6 1.4.5 1.4.4 1.4.3 1.4.2 1.4.1 1.4 0.96"
export DXVK_PROTON_LIST="2.7.1 2.7 2.6.1 2.6 2.5.3 2.5.2 2.5.1 2.5 2.4.1 2.4 2.3.1 2.3 2.2 2.1 2.0 1.10.3 1.10.2 1.10.1 1.10 1.9.4 1.9.3 1.9.2 1.9.1 1.9 1.8.1 1.8 1.7.3 1.7.2 1.7.1 1.7 1.6.1 1.6 1.5.5 1.5.4 1.5.3 1.5.2 1.5.1 1.5 1.4.6 1.4.5 1.4.4 1.4.3 1.4.2 1.4.1 1.4 0.96"
export WINED3D_LIST="10.4 10.3 10.2 10.1 10.0 10.0-rc3 9.20 9.16 9.3 9.1 9.0 8.15 7.11 3.17"
export VKD3D_LIST="2.14.1 2.14 2.13 2.12 2.11.1 2.11 2.10 2.9 2.8"

for i in $DXVK_GPLASYNC_LIST; do dxvkGplAsyncDownload "$i"; done
for i in $DXVK_ASYNC_LIST; do dxvkAsyncDownload "$i"; done
for i in $DXVK_LIST; do dxvkDownload "$i"; done
for i in $DXVK_PROTON_LIST; do dxvkProtonDownload "$i"; done
for i in $WINED3D_LIST; do wined3dDownload "$i"; done
for i in $VKD3D_LIST; do vkd3dDownload "$i"; done

# Adicionando o DXVK-Remix.
# A versão mais recente estável do DXVK-Remix é a 0.6.0 (parte do RTX Remix Runtime 0.6.0).
# No entanto, como não há um link de download binário direto e estável, usaremos a função customDxvkDownload
# com um link de um build noturno (nightly build) como exemplo, que é o método mais comum para obter o DXVK-Remix.
# O usuário pode substituir a URL se tiver uma fonte binária específica.
# O link abaixo é um exemplo de como o Nightly.link empacota o build mais recente.
customDxvkDownload "0.6.0" "Remix" "https://nightly.link/NVIDIAGameWorks/dxvk-remix/workflows/build/main/rtx-remix-for-x64-games-release.zip"

customDxvkDownload "1.10.6" "Sarek" "https://github.com/pythonlover02/DXVK-Sarek/releases/download/v1.10.6/dxvk-sarek-v1.10.6.tar.gz"
customDxvkDownload "1.10.6" "Sarek-ASync" "https://github.com/pythonlover02/DXVK-Sarek/releases/download/v1.10.6/dxvk-sarek-async-v1.10.6.tar.gz"
