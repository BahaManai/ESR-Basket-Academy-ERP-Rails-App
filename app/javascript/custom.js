document.addEventListener("DOMContentLoaded", () => {
    console.log("Custom JavaScript loaded!");
});

function initializeSalaireForm() {
    document.getElementById("btnAjout").addEventListener("click", showForm);
    document.getElementById("btnAnnuler").addEventListener("click", hideForm);
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
function showForm() {
    console.log("works");
    document.getElementById("salaireForm").style.display = "block";
}

function hideForm() {
    document.getElementById("salaireForm").style.display = "none";
}

document.addEventListener("DOMContentLoaded", initializeSalaireForm);
document.addEventListener("turbo:frame-load", initializeSalaireForm);
document.addEventListener("turbo:load", initializeSalaireForm);