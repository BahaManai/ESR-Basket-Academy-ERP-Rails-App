document.addEventListener("DOMContentLoaded", () => {
    console.log("Custom JavaScript loaded!");
});

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
            } else {
                alert("Veuillez sélectionner un mois et une année.");
                event.preventDefault();
            }
        });
    }
}

function initializePaiementForm() {
    document.getElementById("btnAjout2").addEventListener("click", () => toggleForm("paiementForm", true));
    document.getElementById("btnAnnuler2").addEventListener("click", () => toggleForm("paiementForm", false));
}

function toggleForm(formId, show) {
    const form = document.getElementById(formId);
    if (form) {
        form.style.display = show ? "block" : "none";
    }
}

document.addEventListener("DOMContentLoaded", initializeSalaireForm);
document.addEventListener("turbo:frame-load", initializeSalaireForm);
document.addEventListener("turbo:load", initializeSalaireForm);
document.addEventListener("DOMContentLoaded", initializePaiementForm);
document.addEventListener("turbo:frame-load", initializePaiementForm);
document.addEventListener("turbo:load", initializePaiementForm);