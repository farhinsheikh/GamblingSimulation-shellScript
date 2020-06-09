echo "Welcome to gambling simulation problem"

stake=100
Bet=1
Win=1
Loss=0

echo "Initial Stake $stake"

stakePercentAmount=$(( 50 * $stake/100 ))
max_win=$(( $stakePercentAmount+$stake ))
max_loss=$(( $stake-$stakePercentAmount ))
numOfDays=30
totalWinOrLoss=0
daysWin=0
daysLoss=0

declare -A fullDay
declare -A maxMinDay

function getresult()
{
	dayStake=$stake
	while [ $dayStake -lt $max_win ] && [ $dayStake -gt $max_loss ]
		do
        random=$(( RANDOM%2 ))

        if [ $random -eq 1 ]
        then
				dayStake=$(( $dayStake+$Bet ))
        else
				dayStake=$(( $dayStake-$Bet ))
        fi
		done
}

	for (( day=0; day<$numOfDays; day++ ))
		do
        getresult

			if [ $dayStake -eq $max_loss ]
				then
					totalWinOrloss=$(( $totalWinOrloss-$stakePercentAmount ))
					fullDay["Day $day"]=-$stakePercentAmount
					maxMinDay["Day $day"]=$totalWinOrloss
               (( daysLoss++ ))
				else
					totalWinOrloss=$(( $totalWinOrloss+$stakePercentAmount ))
					fullDay["Day $day"]=$stakePercentAmount
					maxMinDay["Day $day"]=$totalWinOrloss
					(( daysWin++ ))
			 fi
		done

echo "Total Won orloss : $totalWinOrLoss"
echo "No. of days Win $daysWin by $(($daysWin*$stakePercentAmount))" 
echo "No. of days Loss $daysLoss by  $(($daysLoss*$stakePercentAmount))"
echo "${!maxMinDay[@]} : ${maxMinDay[@]}"

luckiestDay=$( printf "%s\n" ${maxMinDay[@]} | sort -nr | head -1 )
unluckiestDay=$( printf "%s\n" ${maxMinDay[@]} | sort -nr | tail -1 )


	for data in "${!maxMinDay[@]}"
     	do
		if [[ ${maxMinDay[$data]} -eq $luckiestDay ]]
		then
		echo "LUCKIEST DAY-" $data
		elif [[ ${maxMinDay[$data]} -eq $unluckiestDay ]]
		then
		echo "UNLUCKIEST DAY-" $data
		fi
     	done



