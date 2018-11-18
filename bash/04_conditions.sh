#!/bin/sh
read -p "Enter your favorite season (spring/summer/fall/autumn/winter): " season
case $season in
spring)
	echo "Spring season is 1st Match to 31 May"
	;;
 
summer)
	echo "Summer season is 1st June to Augutst 31"
	;;
fall | autumn)
	echo "Fall or Autum season is 1st Sept to 30 Nov"
	;;
winter)
	echo "Winter season is 1st Dec to 28th Feb"
	;;
*)
	echo "Apologies, I don't know this season"
esac
