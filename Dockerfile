FROM delfer/alpine-ftp-server

ENV FTP_USER=scheck
ENV FTP_PASS=mYp@ssw0rd
# Install openssl
RUN apk --no-cache add openssl

# Copy custom configuration file
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
# Create a virtual user with the specified password
RUN echo "$FTP_USER:$(openssl passwd -1 $FTP_PASS)" > /etc/vsftpd/virtual_users.txt
# Expose FTP port
EXPOSE 21
# Command to run the FTP server
CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]