echo "Welcome to gambling simulation problem"

Stake=100
Bet=1
Win=1
Loss=0
Day=1
numOfDays=20
totalWinOrloss=0
echo "Initial Stake $Stake"

stakePercentAmount=$(( 50*$Stake/100 ))
max_win=$(( $stakePercentAmount+$Stake ))
max_loss=$(( $Stake-$stakePercentAmount ))

function getresult()
{
	while [ $Stake -lt $max_win ] && [ $Stake -gt $max_loss ]
		do
        random=$(( RANDOM%2 ))

        if [ $random -eq 1 ]
        then
				Stake=$(( Stake+$Bet ))
        else
				Stake=$(( Stake-$Bet ))
        fi
		done
}

	for (( day=0; day<$numOfDays; day++ ))
		do
        getresult

			if [ $Stake -eq $max_loss ]
				then
					totalWinOrloss=$(( totalWinOrloss-50 ))
				else
                totalWinOrloss=$(( totalWinOrloss+50 ))
			fi
        		echo "Resign for the day"
        done

 echo "Total win or loss=$totalWinOrloss"



