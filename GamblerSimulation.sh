echo "Welcome to gambling simulation problem"

stake=100
Bet=1
Win=1
Loss=0
Day=1

echo "Initial Stake $Stake"

stakePercentAmount=$(( 50*$stake/100 ))
max_win=$(( $stakePercentAmount+$stake ))
max_loss=$(( $stake-$stakePercentAmount ))
numOfDays=20

function getresult()
{
	dayStake=$stake
	while [ $dayStake -lt $max_win ] && [ $dayStake -gt $max_loss ]
		do
        random=$(( RANDOM%2 ))

        if [ $random -eq 1 ]
        then
				dayStake=$(( dayStake+$Bet ))
        else
				dayStake=$(( dayStake-$Bet ))
        fi
		done
}

	for (( day=0; day<$numOfDays; day++ ))
		do
        getresult

			if [ $dayStake -eq $max_loss ]
				then
					totalWinOrloss=$(( totalWinOrloss-50 ))
				else
                totalWinOrloss=$(( totalWinOrloss+50 ))
			fi
        done

 echo "Total win or loss amount for 20 days is $totalWinOrloss"



