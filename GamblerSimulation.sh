echo "Welcome to gambling simulation problem"

Stake=100
Bet=1
Win=1
Loss=0
echo "Initial Stake $Stake"

function result()
{
        random=$(( RANDOM%2 ))

        if [ $random -eq 1 ]
        then
                Stake=$(( Stake+1 ))
        else
                Stake=$(( Stake-1 ))
        fi
}

result

echo $Stake
