echo "Welcome to gambling simulation problem"

Stake=100
Bet=1
Win=1
Loss=0
Day=1

echo "Initial Stake $Stake"

stakePercentAmount=$(( 50*$Stake/100 ))
max_win=$(( $stakePercentAmount+$Stake ))
max_loss=$(( $Stake-$stakePercentAmount ))

function result()
{
	while [ $Stake -lt $max_win ] && [ $Stake -gt $max_loss ]
		do
        random=$(( RANDOM%2 ))

        if [ $random -eq 1 ]
        then
                Stake=$(( Stake+Bet ))
        else
                Stake=$(( Stake-Bet ))
        fi
		done
}

result

echo $Stake
echo "Resign for the day"
