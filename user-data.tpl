#cloud-config
# vim: set filetype=yaml :

write-files:
  - path: "/src/index.html"
    content: |
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="utf-8" />
          <meta name="viewport" content="width=device-width" />
          <title>terraform-nginx-example</title>
        </head>
        <body>
          <h1>Hello World!</h1>
          <p>
            I was created through a terraform deployment!
          </p>
        </body>
      </html>


coreos:
  units:
    - name: nginx.service
      content: |
        [Unit]
        After=docker.service

        [Service]
        ExecStartPre=/usr/bin/docker pull nginx:${nginx_version}
        ExecStartPre=-/usr/bin/docker kill %n
        ExecStartPre=-/usr/bin/docker rm %n
        ExecStart=/usr/bin/docker run \
          -p 80:80 \
          -v /src:/usr/share/nginx/html \
          --name %n nginx
        ExecStop=/usr/bin/docker stop -t 3 %n
        Restart=on-failure
      command: start

