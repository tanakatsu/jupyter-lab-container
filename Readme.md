## jupyter-lab-container

### How to use

1. Build container image
    ```
    $ ./build.sh
    ```
    You'll be asked for your jupyter lab password. Set your own jupyter lab's password.
1. Start jupyter lab
    ```
    $ ./start_server.sh
    ```
    You will need port forwarding when you use jupyter-lab in remote machines.
    You should add `-L 8082:localhost:8082` option for remote login. 
1. Open your browser

    Open `http://localhost:8082` in your browser

