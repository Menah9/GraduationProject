# استخدم نسخة Odoo 17
FROM odoo:17

# استخدم root لنسخ الملفات وتعديل الصلاحيات
USER root

# انسخ ملفات المشروع (الإضافة)
COPY . /mnt/extra-addons/graduation

# عدّل صلاحيات الملفات
RUN chown -R odoo:odoo /mnt/extra-addons

# ارجع لمستخدم odoo
USER odoo

# إعداد مسار الإضافات
ENV ADDONS_PATH=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons

# استخدم المنفذ الديناميكي من Render
EXPOSE 8069

# الأمر الرئيسي لتشغيل Odoo
CMD ["odoo","-d","${DB_NAME}","--db_host","${DB_HOST}","--db_port","${DB_PORT}","--db_user","${DB_USER}","--db_password","${DB_PASSWORD}","--addons-path","/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons","--http-port","${PORT}"]

