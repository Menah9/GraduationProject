# Odoo 17
FROM odoo:17.0

# نستخدم root مؤقتاً لنسخ الموديول وتعديل الصلاحيات
USER root

# انسخ إضافة "graduation" إلى مسار الإضافات
COPY graduation /mnt/extra-addons/graduation

# أعطي صلاحيات لـ odoo
RUN chown -R odoo:odoo /mnt/extra-addons

# ارجع لمستخدم odoo
USER odoo

# المنفذ الافتراضي
EXPOSE 8069

# شغّل Odoo واقرأ متغيرات البيئة من Render
# استخدمنا shell form عشان يتم استبدال متغيرات البيئة ($DB_HOST...)
CMD bash -lc 'odoo \
  --db_host="$DB_HOST" \
  --db_port="$DB_PORT" \
  --db_user="$DB_USER" \
  --db_password="$DB_PASSWORD" \
  --addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons \
  --http-port=8069'

