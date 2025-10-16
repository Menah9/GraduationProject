# نستخدم الصورة الرسمية لـ Odoo 17
FROM odoo:17.0

# ندخل الإضافة الخاصة في مجلد extra-addons
USER root
COPY graduation /mnt/extra-addons/graduation
RUN chown -R odoo:odoo /mnt/extra-addons

# نرجّع المستخدم الافتراضي
USER odoo

# مسار الإضافات (الافتراضية + إضافتنا)
ENV ADDONS_PATH=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons

EXPOSE 8069

# نشغّل أودو مع متغيرات قاعدة البيانات من Render
CMD ["odoo",
     "--db_host=${DB_HOST}",
     "--db_port=${DB_PORT}",
     "--db_user=${DB_USER}",
     "--db_password=${DB_PASSWORD}",
     "--addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons",
     "--http-port=8069"]
