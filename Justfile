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


network option:
    #!/bin/bash
     case {{option}} in
     "up")
        echo "Bring the Development  test-nework up  with 3 Organazition 🚀🚀🚀"
        bash startDev.sh
        echo "Deploy the chainCode. 🚀🚀🚀🚀🚀🚀"
        ./upgradeCC.sh 0.2 2
        ;;
     "down")
     echo "Bring the test-network down  and Container Down🔥🔥🔥"
     cd fabric && ./network.sh down && cd ../
     ./downContainer.sh

     ;;
     "*")
     echo "Check your comment a agian ! (Just network up|down)"
     ;;
     esac

api option:
    #!/bin/bash
     case {{option}} in
     "up")
        echo "To apply CC API changes 🚀🚀🚀"
        bash  ./scripts/reloadCCAPI.sh
        ;;
     "down")
     echo "Deploy Chaincode as service 🔥🔥🔥"
     ./startDev.sh -ccaas
     ;;
    "cc-as-service")
    echo "Starting development environment with chaincode as a service 🚀🚀🚀"
    ./startDev.sh -ccaas
    echo "Deploying the chaincode as a service 🚀🚀🚀"
    ./upgradeCC.sh -ccaas 0.2 2

     ;;
     "*")
      echo "Check your command again! Use 'api up', 'api down', or 'api cc-as-service'."
     ;;
     esac
