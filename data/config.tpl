application:

  # API key used to authenticate at the server.
  api_key: "{{api_key}}"

  # URL of the vantage6 server
  server_url: "{{v6_server}}"

  # port the server listens to
  port: 443


  # subnet of the VPN server
  vpn_subnet: 10.155.40.0/24


  api_path: "/api"

  # add additional environment variables to the algorithm containers.
  # this could be usefull for passwords or other things that algorithms
  # need to know about the node it is running on
  # OPTIONAL
  algorithm_env:

    # in this example the environment variable 'player' has
    # the value 'Alice' inside the algorithm container
    player: "{{name}}"

  # specify custom Docker images to use for starting the different
  # components.
  # OPTIONAL
  images:
    node: harbor2.vantage6.ai/infrastructure/node:3.7.0

  # path or endpoint to the local data source. The client can request a
  # certain database to be used if it is specified here. They are
  # specified as label:local_path pairs.
  databases:
    default: "{{homedir.stdout}}/data.csv"

  # end-to-end encryption settings
  encryption:

    # whenever encryption is enabled or not. This should be the same
    # as the `encrypted` setting of the collaboration to which this
    # node belongs.
    enabled: false

  # To control which algorithms are allowed at the node you can set
  # the allowed_images key. This is expected to be a valid regular
  # expression
  allowed_images:
    - ^harbor.carrier-mu.src.surf-hosted.nl/carrier/[a-zA-Z]+

  # Settings for the logger
  logging:
    # Controls the logging output level. Could be one of the following
    # levels: CRITICAL, ERROR, WARNING, INFO, DEBUG, NOTSET
    level: DEBUG

    # Filename of the log-file, used by RotatingFileHandler
    file: ${NODE}.log

    # whenever the output needs to be shown in the console
    use_console: True

    # The number of log files that are kept, used by RotatingFileHandler
    backup_count: 5

    # Size kb of a single log file, used by RotatingFileHandler
    max_size: 1024

    # format: input for logging.Formatter,
    format: "%(asctime)s - %(name)-14s - %(levelname)-8s - %(message)s"
    datefmt: "%Y-%m-%d %H:%M:%S"

  # directory where local task files (input/output) are stored
  task_dir: "{{homedir.stdout}}/.local/share/vantage6/node/{{name}}"