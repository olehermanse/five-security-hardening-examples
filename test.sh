# To test the policy, you can transfer and run this script on your hub:
# cf-remote scp -H hub test.sh && cf-remote sudo -H hub "bash test.sh"

touch /etc/ssh/shosts.equiv
touch /etc/cron.allow
chmod 0777 /etc/cron.allow
echo "blah" > /etc/motd
apt install -y squid >/dev/null 2>/dev/null
apt remove -y aide >/dev/null 2>/dev/null
cf-agent -KI
