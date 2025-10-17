# استخدم نسخة Odoo الرسمية
FROM odoo:17.0

# انسخ كل الملفات (الموديول) داخل مجلد إضافات Odoo
COPY . /mnt/extra-addons/graduation

# إعطاء صلاحيات للمجلد
RUN chmod -R 777 /mnt/extra-addons/graduation

# تعريف متغيرات الاتصال بقاعدة البيانات
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_USER=${DB_USER}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV DB_NAME=${DB_NAME}
ENV PORT=${PORT}

# الأوامر لتشغيل Odoo
CMD ["odoo","-d","${DB_NAME}","--db_host=${DB_HOST}","--db_port=${DB_PORT}","--db_user=${DB_USER}","--db_password=${DB_PASSWORD}","--addons-path=/mnt/extra-addons","--http-port=${PORT}"]
