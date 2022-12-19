# To test the policy, you can transfer and run this script on your hub:
# cf-remote scp -H hub test.sh && cf-remote sudo -H hub "bash test.sh"

# You should see 5 changes, one per policy file (5 info log messages):
#   info: Deleted file '/etc/ssh/shosts.equiv'
#   info: Object '/etc/cron.allow' had permissions 0777, changed it to 0640
#   info: Updated content of '/etc/motd' with content 'Production host:
# Hostname: $(sys.hostname)
# Maintainer: Alice@example.com
# '
#   info: Successfully installed package 'aide'
#   info: Successfully removed package 'squid'

touch /etc/ssh/shosts.equiv
touch /etc/cron.allow
chmod 0777 /etc/cron.allow
cat "blah" > /etc/motd
apt install -y squid >/dev/null 2>/dev/null
apt remove -y aide >/dev/null 2>/dev/null
cf-agent -KI
