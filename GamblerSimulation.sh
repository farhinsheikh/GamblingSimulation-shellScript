#!/bin/bash -x
echo "Welcome to gambling simulation problem"

#constants
STAKE=100
NUM_OF_DAYS=30
WIN=1
LOSS=0
BET=1
LAST_LOSSAMOUNT=0

echo "Initial Stake $STAKE"
echo "enter percent of the stake"
read UserPercent

#variables
stakePercentAmount=$(( $UserPercent*STAKE/100 ))
maxWin=$(( $stakePercentAmount+$STAKE ))
maxLoss=$(( $STAKE-$stakePercentAmount ))
totalWinOrLoss=0
daysWin=0
daysLoss=0

declare -A day
declare -A month

function getdailyBet()
{
   dayStake=$STAKE
   while [ $dayStake -lt $maxWin ] && [ $dayStake -gt $maxLoss ]
   do
     random=$(( RANDOM % 2 ))
     if [ $random -eq 1 ]
     then
        dayStake=$(( $dayStake+$BET ))
     else
        dayStake=$(( $dayStake-$BET ))
     fi
   done
}

function getmonthBet(){

   for (( day=1; day<=$NUM_OF_DAYS; day++ ))
   do
   getdailyBet
      if [ $dayStake -eq $maxLoss ]
      then
         totalWinOrLoss=$(( $totalWinOrLoss - $stakePercentAmount ))
         day["Day $day"]=-$stakePercentAmount
         month["Day $day"]=$totalWinOrLoss
         ((daysLoss++))
      else
         totalWinOrLoss=$(( $totalWinOrLoss + $stakePercentAmount ))
         day["Day $day"]=$stakePercentAmount
         month["Day $day"]=$totalWinOrLoss
         ((daysWin++))
      fi
   done

   echo "Total Won/loss : $totalWinOrLoss"
   echo "No. of days Win $daysWin by $(($daysWin*$stakePercentAmount))" 
   echo "No. of days Loss $daysLoss by  $(($daysLoss*$stakePercentAmount))"
   echo "${!month[@]} : ${month[@]}"

   luckiestDay=$( printf "%s\n" ${month[@]} | sort -nr | head -1 )
   unluckiestDay=$( printf "%s\n" ${month[@]} | sort -nr | tail -1 )


   for data in "${!month[@]}"
   do
      if [[ ${month[$data]} -eq $luckiestDay ]]
      then
         echo "LUCKIEST DAY- $data $luckiestDay"
      elif [[ ${month[$data]} -eq $unluckiestDay ]]
      then
         echo "UNLUCKIEST DAY- $data $unluckiestDay"
      fi
   done
}

function isContinuePlaying(){
while [ true ]
do
   getmonthBet
   if [ $totalWinOrLoss -lt $LAST_LOSSAMOUNT ]
   then
      echo "you lost, can't paly"
      break
   else
      echo "you won $totalWinOrLoss, continue playing"
   fi
done
}
 isContinuePlaying
