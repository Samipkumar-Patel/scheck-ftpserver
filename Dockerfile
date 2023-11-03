FROM delfer/alpine-ftp-server

ENV FTP_USER=scheck
ENV FTP_PASSWORD=scheckpass
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
EXPOSE 21

CMD ["sh", "-c", "echo \"$FTP_USER:$FTP_PASS:1001:1001::/home/$FTP_USER:/bin/false\" >> /etc/vsftpd/virtual_users.txt && /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf"]
