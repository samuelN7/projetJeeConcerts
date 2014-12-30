package projet_jee;
import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Tournee {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    int id;
    String titre;
    String description;
    @ManyToOne
    Artiste artiste;
    @OneToMany(mappedBy="tournee")
    Collection<Evenements> evenements;
    



}
