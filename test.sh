ssh -i ~/.ssh/team2-week15.pem ubuntu@ec2-18-185-48-199.eu-central-1.compute.amazonaws.com '
sudo apt-get update
sudo apt-get install python3.6
mkdir proba
cd proba
echo AAa > index.html
python3 -m http.server 8000'