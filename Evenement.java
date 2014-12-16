package projet_jee;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Evenement {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	int id_artiste;
	int id_salle;
	String titre;
	String description;
	int prix;

}
