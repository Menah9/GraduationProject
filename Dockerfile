# استخدم نسخة Odoo الرسمية
FROM odoo:17.0

# انتقلي إلى المستخدم root مؤقتًا لتتمكني من النسخ وتعديل الصلاحيات
USER root

# انسخ ملفات المشروع إلى مجلد إضافات Odoo
COPY . /mnt/extra-addons/graduation

# إعطاء صلاحيات للوصول إلى المجلد
RUN chmod -R 777 /mnt/extra-addons/graduation

# ارجعي إلى المستخدم odoo الافتراضي
USER odoo

# تعريف متغيرات الاتصال بقاعدة البيانات
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_USER=${DB_USER}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV DB_NAME=${DB_NAME}
ENV PORT=${PORT}

# تشغيل Odoo
CMD ["odoo","-d","${DB_NAME}","--db_host=${DB_HOST}","--db_port=${DB_PORT}","--db_user=${DB_USER}","--db_password=${DB_PASSWORD}","--addons-path=/mnt/extra-addons","--http-port=${PORT}"]
