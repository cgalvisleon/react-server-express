#!/bin/bash

HELP=false
BUILD=false
TEST=false
BRANCH=$(git branch --show-current)                              # Valor para validar el namespace
IMAGE="cgalvisleon/react-server-express"                               # Valor $IMAGE
VERSION=$(git describe --tags --abbrev=0)                        # Valor para reemplazar $VERSION obtenido de Git
RELEASE="$VERSION-$CURRENT_DATETIME"                             # Valor para reemplazar $RELEASE

# Parsear opciones
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --h | --help) HELP=true ;;               # Activar la bandera si se proporciona --help
        --b | --build) BUILD=true ;;            # Activar la bandera si se proporciona --build
        --t | --test) TEST=true ;;               # Activar la bandera si se proporciona --test
        *) echo "Opción desconocida: $1"; exit 1 ;;
    esac
    shift
done

if [ "$BRANCH" == "main" ]; then
  IMAGE_VERSION="$IMAGE:$VERSION"                              # Valor para reemplazar $IMAGE
else
  IMAGE_VERSION="$IMAGE:$VERSION-beta"                         # Valor para reemplazar $IMAGE
fi

# Función para construir la imagen de Docker
build_image() {
  local platform=$1
  local image=$2
  local dockerfile=$3
  local tag_latest=$4

  # Si tag_latest es true, taggear como latest
  if [ "$tag_latest" = true ]; then
      docker buildx build --platform "$platform" \
        -t "$IMAGE:latest" \
        -t "$image" \
        -f "$dockerfile" --push .
      echo "Imagen $image y $IMAGE:latest creadas con éxito."
  else
      docker buildx build --platform "$platform" \
        -t "$image" \
        -f "$dockerfile" --push .
      echo "Imagen $image creada con éxito."
  fi
}

if [ "$BUILD" = true ]; then
  build_image "linux/amd64,linux/arm64" "$IMAGE_VERSION" "./Dockerfile" true
else
  echo "Uso: deploy.sh [opciones]"
  echo "Opciones:"
  echo "  --h, --help: Muestra este mensaje de ayuda."
  echo "  --b, --build: Construye la imagen de Docker y la sube al registro de contenedores."
  exit 0
fi
