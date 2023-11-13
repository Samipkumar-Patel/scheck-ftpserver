FROM delfer/alpine-ftp-server

# Set environment variables for FTP users and passwords
ENV USERS="one|ecoviumM2"

# Install openssl
RUN apk --no-cache add openssl

# Copy custom configuration file
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

# Create virtual users with specified passwords
RUN echo "$USERS" | while IFS='|' read -r user pass; do \
      echo "$user:$(openssl passwd -1 $pass)" >> /etc/vsftpd/virtual_users.txt; \
  done

# Expose FTP port
EXPOSE 990

# Command to run the FTP server
CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf", "--ssl_enable=YES", "--require_ssl_reuse=NO", "--ssl_ciphers=HIGH"]
