ui option:
    #!/bin/bash
     case {{option}} in
     "up")
        echo "Bring the UI up 🚀🚀🚀"
        ./startWeb.sh
        ;;
     "down")
     echo "Bring the UI down 🔥🔥🔥"
        docker-compose -f ccapi/web-client/docker-compose-goinitus.yaml down 
     ;;
     "*")
     echo "Check your comment a agian ! (ui up|down)"
     ;;
     esac 