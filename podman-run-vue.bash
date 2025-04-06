podman build --no-cache --rm -f Containerfile -t vue:demo .
podman run --interactive --tty -p 5173:80 vue:demo
echo "browse http://localhost:5173/"
