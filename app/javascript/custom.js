function initializeDataTables() {
    const tables = document.querySelectorAll(".datatable");

    tables.forEach(table => {
        if (table && !$.fn.dataTable.isDataTable(table)) {
            new DataTable(table, {
                paging: true,
                searching: true,
                ordering: true,
                info: true,
                order: [],
                columnDefs: [
                    { orderable: false, targets: -1 }
                ]
            });
        }
    });
}

function initializeFlatpickr() {
    flatpickr(".datepicker", {
        dateFormat: "Y-m-d",
        locale: "fr",
        allowInput: true
    });
    flatpickr(".monthpicker", {
        plugins: [
            new monthSelectPlugin({
                shorthand: true,
                dateFormat: "Y-m"
            })
        ],
        altInput: true,
        altFormat: "F Y",
        locale: "fr",
        allowInput: true
    });
}

function initializeSalaireForm() {
    document.getElementById("btnAjout").addEventListener("click", () => toggleForm("salaireForm", true));
    document.getElementById("btnAnnuler").addEventListener("click", () => toggleForm("salaireForm", false));

    const form = document.getElementById("salaireFormElement");

    const monthPicker = document.getElementById("monthPicker");
    const moisField = document.getElementById("moisField");
    const anneeField = document.getElementById("anneeField");

    if (form && monthPicker) {
        form.addEventListener("submit", function (event) {
            if (monthPicker.value) {
                const [year, month] = monthPicker.value.split("-");
                moisField.value = parseInt(month, 10);
                anneeField.value = year;
            }
        });
    }
}

function initializeEntraineurForm() {
    const monthPicker2 = document.getElementById("monthPicker2");
    const moisField2 = document.getElementById("mois2");
    const anneeField2 = document.getElementById("annee2");

    if (monthPicker2) {
        monthPicker2.addEventListener("change", function () {
            const [year2, month2] = monthPicker2.value.split("-");
            moisField2.value = parseInt(month2, 10);
            anneeField2.value = year2;
        });
    }
}

function initializeNewSalaireForm2() {
    const monthPicker3 = document.getElementById("monthPicker3");
    const moisField3 = document.getElementById("moisField3");
    const anneeField3 = document.getElementById("anneeField3");

    if (monthPicker3) {
        monthPicker3.addEventListener("change", function () {
            const [year3, month3] = monthPicker3.value.split("-");
            moisField3.value = parseInt(month3, 10);
            anneeField3.value = year3;
        });
    }
}

function initializePaiementForm() {
    document.getElementById("btnAjout2").addEventListener("click", () => toggleForm("paiementForm", true));
    document.getElementById("btnAnnuler2").addEventListener("click", () => toggleForm("paiementForm", false));
}

function initializeAssuranceForm() {
    document.getElementById("btnAjout3").addEventListener("click", () => toggleForm("assuranceForm", true));
    document.getElementById("btnAnnuler3").addEventListener("click", () => toggleForm("assuranceForm", false));
}

function initializeAchatForm() {
    document.getElementById("btnAjout4").addEventListener("click", () => toggleForm("achatForm", true));
    document.getElementById("btnAnnuler4").addEventListener("click", () => toggleForm("achatForm", false));
}

function initializeCreditForm() {
    document.getElementById("btnAjout5").addEventListener("click", () => toggleForm("creditForm", true));
    document.getElementById("btnAnnuler5").addEventListener("click", () => toggleForm("creditForm", false));
}

function toggleForm(formId, show) {
    const form = document.getElementById(formId);
    if (form) {
        form.style.display = show ? "block" : "none";
    }
}

function onChangeProduitAchat() {
    const productSelect = document.getElementById("product_select");
    const designationField = document.getElementById("designation_field");
    const prixField = document.getElementById("prix_field");

    productSelect.addEventListener("change", function () {
        designationField.value = productSelect.value;

        const selectedOption = productSelect.options[productSelect.selectedIndex];
        const price = selectedOption.dataset.price;

        prixField.value = price || "";
    });
}

function onChangeSaisonMontant() {
    const saisonSelect = document.getElementById("assurance_saison_id");
    const montantField = document.getElementById("montant-field");
    if (saisonSelect && montantField) {
        saisonSelect.addEventListener("change", function () {
            const selectedOption = saisonSelect.options[saisonSelect.selectedIndex];
            const montantAssurance = selectedOption.dataset.montant;
            montantField.value = montantAssurance || "";
        });
    }
}

function bootstrapValidation() {
    'use strict'

    var forms = document.querySelectorAll('.needs-validation')

    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
}


document.addEventListener("DOMContentLoaded", initializeSalaireForm);
document.addEventListener("turbo:frame-load", initializeSalaireForm);
document.addEventListener("turbo:load", initializeSalaireForm);

document.addEventListener("DOMContentLoaded", initializePaiementForm);
document.addEventListener("turbo:frame-load", initializePaiementForm);
document.addEventListener("turbo:load", initializePaiementForm);

document.addEventListener("DOMContentLoaded", initializeAssuranceForm);
document.addEventListener("turbo:frame-load", initializeAssuranceForm);
document.addEventListener("turbo:load", initializeAssuranceForm);

document.addEventListener("DOMContentLoaded", initializeAchatForm);
document.addEventListener("turbo:frame-load", initializeAchatForm);
document.addEventListener("turbo:load", initializeAchatForm);

document.addEventListener("DOMContentLoaded", initializeCreditForm);
document.addEventListener("turbo:frame-load", initializeCreditForm);
document.addEventListener("turbo:load", initializeCreditForm);

document.addEventListener("DOMContentLoaded", initializeEntraineurForm);
document.addEventListener("turbo:frame-load", initializeEntraineurForm);
document.addEventListener("turbo:load", initializeEntraineurForm);

document.addEventListener("DOMContentLoaded", initializeDataTables);
document.addEventListener("turbo:frame-load", initializeDataTables);
document.addEventListener("turbo:load", initializeDataTables);
document.addEventListener("turbo:before-cache", () => {
    $(".datatable").each(function () {
        if ($.fn.dataTable.isDataTable(this)) {
            $(this).DataTable().destroy();
            $(this).removeClass('dataTable');
            $(this).siblings('.dataTables_wrapper').remove();
        }
    });
});

document.addEventListener("DOMContentLoaded", onChangeSaisonMontant);
document.addEventListener("turbo:frame-load", onChangeSaisonMontant);
document.addEventListener("turbo:load", onChangeSaisonMontant);

document.addEventListener("DOMContentLoaded", onChangeProduitAchat);
document.addEventListener("turbo:frame-load", onChangeProduitAchat);
document.addEventListener("turbo:load", onChangeProduitAchat);

document.addEventListener("DOMContentLoaded", initializeFlatpickr);
document.addEventListener("turbo:frame-load", initializeFlatpickr);
document.addEventListener("turbo:load", initializeFlatpickr);
document.addEventListener("turbo:before-cache", () => {
    document.querySelectorAll(".monthpicker").forEach((element) => {
        if (element._flatpickr) {
            element._flatpickr.destroy();
        }
    });
});

document.addEventListener("DOMContentLoaded", initializeNewSalaireForm2);
document.addEventListener("turbo:frame-load", initializeNewSalaireForm2);
document.addEventListener("turbo:load", initializeNewSalaireForm2);

document.addEventListener("DOMContentLoaded", bootstrapValidation);
document.addEventListener("turbo:frame-load", bootstrapValidation);
document.addEventListener("turbo:load", bootstrapValidation);