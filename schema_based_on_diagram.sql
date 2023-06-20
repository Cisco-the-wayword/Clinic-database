CREATE TABLE "patients"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);
ALTER TABLE
    "patients" ADD PRIMARY KEY("id");
CREATE TABLE "medical_histories"(
    "id" INTEGER NOT NULL,
    "admitted_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL
);
CREATE INDEX "medical_histories_patient_id_index" ON
    "medical_histories"("patient_id");
ALTER TABLE
    "medical_histories" ADD PRIMARY KEY("id");
ALTER TABLE
    "medical_histories" ADD CONSTRAINT "medical_histories_patient_id_unique" UNIQUE("patient_id");
ALTER TABLE
    "medical_histories" ADD CONSTRAINT "medical_histories_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "patients"("id");

CREATE TABLE "invoice_items"(
    "id" INTEGER NOT NULL,
    "unit_price" DECIMAL(8, 2) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "treatment_id" INTEGER NOT NULL
);
CREATE INDEX "invoice_items_invoice_id_index" ON
    "invoice_items"("invoice_id");
CREATE INDEX "invoice_items_treatment_id_index" ON
    "invoice_items"("treatment_id");
ALTER TABLE
    "invoice_items" ADD PRIMARY KEY("id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_invoice_id_unique" UNIQUE("invoice_id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_treatment_id_unique" UNIQUE("treatment_id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "invoices"("id");
