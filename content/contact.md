<form name="contact" method="POST" data-netlify="true">
  <label for="name">Nom</label>
  <input type="text" name="name" id="name" required>

  <label for="email">Email</label>
  <input type="email" name="email" id="email" required>

  <label for="message">Message</label>
  <textarea name="message" id="message" required></textarea>

  <button type="submit">Envoyer</button>
</form>

<input type="hidden" name="form-name" value="contact">
<form name="contact" method="POST" data-netlify="true" action="/merci">

<style>
  form {
    max-width: 600px;
    margin: 0 auto; /* Centre le formulaire */
    padding: 20px;
    background: #f4f4f4;
    border-radius: 8px;
  }

  label {
    display: block;
    margin-bottom: 8px;
  }

  input, textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  .form-button-container {
    text-align: center; /* Centre le bouton */
    margin-top: 20px; /* Un peu d'espace au-dessus du bouton */
  }

  button {
    display: block; /* Forcer le bouton à être un élément de bloc */
    width: auto; /* Largeur ajustée à son contenu */
    margin: 20px auto 0; /* Centre le bouton avec un espacement au-dessus */
    padding: 10px 20px;
    background-color: #000025; /* Bleu foncé */
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
  }

  button:hover {
    background-color: #333; /* Changement de couleur au survol */
  }
</style>
