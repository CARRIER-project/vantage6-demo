docker run --rm -p 8000:8000 -v vantage6-demo-user-vol:/mnt -v $PWD/static/config.js:/static/config.js -d --name demo_ui \
        harbor.carrier-mu.src.surf-hosted.nl/carrier/demo-ui
