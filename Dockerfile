FROM delfer/alpine-ftp-server

ENV FTP_USER=scheck
ENV FTP_PASS="ECoviuM29!"
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf


EXPOSE 21

CMD ["sh", "-c", "echo $FTP_USER:$(openssl passwd -1 $FTP_PASS) > /etc/vsftpd/virtual_users.txt && vsftpd /etc/vsftpd/vsftpd.conf"]
