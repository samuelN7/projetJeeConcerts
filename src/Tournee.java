package projetJeeConcerts;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.print.attribute.DateTimeSyntax;

@Entity
public class Tournee {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    int id;
    String titre;
    String description;
    DateTimeSyntax dateDebut;
    DateTimeSyntax dateFin;
    @ManyToOne
    Artiste artiste;
    @OneToMany(mappedBy="tournee")
    Collection<Evenement> evenements;
    



}
