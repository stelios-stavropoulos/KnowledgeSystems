(defclass Chemical
	(is-a USER)
	(role abstract)
	(single-slot specificGravity
		(type FLOAT)
		(range 0.9 1.1)
		(default 1.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot toxicity
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nonSolubility
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot chemicalSymbolism
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot englishName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot burnSkin
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot spectroscopy
		(type SYMBOL)
;+		(allowed-parents Carbon Sulphur Metal Sodium)
		(create-accessor read-write))
	(single-slot greekName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot corrosive
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot causesAsphyxiation
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot color
		(type SYMBOL)
;+		(allowed-parents NoneColor Red White)
		(default NoneColor)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot radioactivity
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot smell
		(type SYMBOL)
;+		(allowed-parents NoneSmell Vinegar Choking)
		(default NoneSmell)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 0.0 14.0)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Acid
	(is-a Chemical)
	(role abstract)
	(single-slot pH
		(type FLOAT)
		(range 0.0 5.999999)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass StrongAcid
	(is-a Acid)
	(role concrete)
	(single-slot burnSkin
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 0.0 2.999999)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass WeakAcid
	(is-a Acid)
	(role concrete)
	(single-slot burnSkin
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 3.0 5.999999)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Base
	(is-a Chemical)
	(role abstract)
	(single-slot pH
		(type FLOAT)
		(range 8.0 14.0)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass StrongBase
	(is-a Base)
	(role concrete)
	(single-slot burnSkin
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 11.0 14.0)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass WeakBase
	(is-a Base)
	(role concrete)
	(single-slot burnSkin
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 8.0 10.999999)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Oil
	(is-a Chemical)
	(role concrete)
	(single-slot color
		(type SYMBOL)
;+		(allowed-parents NoneColor Red White)
		(default NoneColor)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot specificGravity
		(type FLOAT)
		(range 0.9 1.1)
		(default 1.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot nonSolubility
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(value TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot smell
		(type SYMBOL)
;+		(allowed-parents NoneSmell Vinegar Choking)
		(default NoneSmell)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 6.0 7.999999)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Color
	(is-a USER)
	(role abstract))

(defclass White
	(is-a Color)
	(role abstract))

(defclass Red
	(is-a Color)
	(role abstract))

(defclass NoneColor
	(is-a Color)
	(role abstract))

(defclass Spectroscopy
	(is-a USER)
	(role abstract))

(defclass Carbon
	(is-a Spectroscopy)
	(role abstract))

(defclass Sulphur
	(is-a Spectroscopy)
	(role abstract))

(defclass Metal
	(is-a Spectroscopy)
	(role abstract))

(defclass Sodium
	(is-a Spectroscopy)
	(role abstract))

(defclass Smell
	(is-a USER)
	(role abstract))

(defclass Choking
	(is-a Smell)
	(role abstract))

(defclass Vinegar
	(is-a Smell)
	(role abstract))

(defclass NoneSmell
	(is-a Smell)
	(role abstract))

(defclass Store
	(is-a USER)
	(role concrete)
	(multislot Chemicals
		(type INSTANCE)
		(allowed-classes StrongBase WeakBase Oil StrongAcid WeakAcid)
		(create-accessor read-write))
	(single-slot pname
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Wells
		(type INSTANCE)
		(allowed-classes Well)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Well
	(is-a USER)
	(role concrete)
	(single-slot pname
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Wells
		(type INSTANCE)
		(allowed-classes Well CheckPoint)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass CheckPoint
	(is-a USER)
	(role concrete)
	(single-slot pname
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))


(definstances test-instances

([HydrochloricAcid] of  StrongAcid

	(burnSkin TRUE)
	(causesAsphyxiation TRUE)
	(chemicalSymbolism "HCl")
	(color NoneColor)
	(corrosive TRUE)
	(englishName "Hydrochloric acid")
	(greekName "Υδροχλωρικό οξύ")
	(nonSolubility FALSE)
	(pH 1.1)
	(radioactivity FALSE)
	(smell NoneSmell)
	(specificGravity 1.0))

([AceticAcid] of  WeakAcid

	(burnSkin FALSE)
	(causesAsphyxiation FALSE)
	(chemicalSymbolism "CH3COOH")
	(color NoneColor)
	(englishName "Acetic acid")
	(greekName "Οξικό οξύ")
	(nonSolubility FALSE)
	(pH 4.76)
	(radioactivity FALSE)
	(smell Vinegar)
	(specificGravity 1.0))

([CarbonicAcid] of  WeakAcid

	(burnSkin FALSE)
	(causesAsphyxiation FALSE)
	(chemicalSymbolism "H2CO3")
	(color NoneColor)
	(englishName "Carbonic acid")
	(greekName "Ανθρακικό οξύ")
	(nonSolubility FALSE)
	(pH 4.68)
	(radioactivity FALSE)
	(smell NoneSmell)
	(specificGravity 1.0)
	(spectroscopy Carbon))

([SodiumHydroxide] of  StrongBase

	(burnSkin FALSE)
	(causesAsphyxiation FALSE)
	(chemicalSymbolism "NaOH")
	(color White)
	(corrosive TRUE)
	(englishName "Sodium hydroxide")
	(greekName "Υδροξείδιο του Νατρίου")
	(nonSolubility FALSE)
	(pH 13.0)
	(radioactivity FALSE)
	(smell NoneSmell)
	(specificGravity 1.0))

([AluminiumHydroxide] of  WeakBase

	(burnSkin FALSE)
	(causesAsphyxiation FALSE)
	(chemicalSymbolism "Al(OH)3")
	(color White)
	(corrosive FALSE)
	(englishName "Aluminium hydroxide")
	(greekName "Υδροξείδιο του Αργιλίου")
	(nonSolubility FALSE)
	(pH 8.5)
	(radioactivity FALSE)
	(smell NoneSmell)
	(specificGravity 1.1)
	(spectroscopy Metal))

([Chromogen23] of  WeakBase

	(burnSkin FALSE)
	(causesAsphyxiation FALSE)
	(color Red)
	(corrosive FALSE)
	(englishName "Chromogen 23")
	(greekName "Χρωμογόνο 23")
	(radioactivity FALSE)
	(smell NoneSmell)
	(specificGravity 0.9))

([RubidiumHydroxide] of  WeakBase

	(burnSkin FALSE)
	(causesAsphyxiation FALSE)
	(chemicalSymbolism "RbOH")
	(color NoneColor)
	(corrosive FALSE)
	(englishName "Rubidium hydroxide")
	(greekName "Υδροξείδιο του Ρουβιδίου")
	(pH 10.5)
	(radioactivity TRUE)
	(smell NoneSmell)
	(specificGravity 1.1)
	(spectroscopy Metal))

([Petrol] of  Oil

	(burnSkin FALSE)
	(causesAsphyxiation FALSE)
	(color NoneColor)
	(corrosive FALSE)
	(englishName "Petrol")
	(greekName "Βενζίνη")
	(radioactivity FALSE)
	(smell NoneSmell)
	(specificGravity 0.9)
	(spectroscopy Carbon))

([TransformerOil] of  Oil

	(burnSkin FALSE)
	(causesAsphyxiation FALSE)
	(color NoneColor)
	(corrosive FALSE)
	(englishName "TransformerOil")
	(greekName "Πετρέλαιο")
	(radioactivity FALSE)
	(smell NoneSmell)
	(specificGravity 1.0)
	(spectroscopy Carbon)
	(toxicity TRUE))

([StathmosElegxou] of  CheckPoint

	(pname "Σταθμός Ελέγχου"))

([Freatio1] of  Well

	(pname "Φρεάτιο 1")
	(Wells [Freatio9]))

([Freatio2] of  Well

	(pname "Φρεάτιο 2")
	(Wells [Freatio9]))

([Freatio3] of  Well

	(pname "Φρεάτιο 3")
	(Wells [Freatio9]))

([Freatio4] of  Well

	(pname "Φρεάτιο 4")
	(Wells [Freatio10]))

([Freatio5] of  Well

	(pname "Φρεάτιο 5")
	(Wells [Freatio10]))

([Freatio6] of  Well

	(pname "Φρεάτιο 6")
	(Wells [Freatio11]))

([Freatio7] of  Well

	(pname "Φρεάτιο 7")
	(Wells [Freatio11]))

([Freatio8] of  Well

	(pname "Φρεάτιο 8")
	(Wells [Freatio13]))

([Freatio9] of  Well

	(pname "Φρεάτιο 9")
	(Wells [Freatio12]))

([Freatio10] of  Well

	(pname "Φρεάτιο 10")
	(Wells [Freatio12]))

([Freatio11] of  Well

	(pname "Φρεάτιο 11")
	(Wells [Freatio13]))

([Freatio12] of  Well

	(pname "Φρεάτιο 12")
	(Wells [StathmosElegxou]))

([Freatio13] of  Well

	(pname "Φρεάτιο 13")
	(Wells [StathmosElegxou]))

([Apothiki1] of  Store

	(Chemicals
		[SulphuricAcid]
		[Petrol])
	(pname "Αποθήκη 1")
	(Wells [Freatio1]))

([Apothiki2] of  Store

	(Chemicals
		[HydrochloricAcid]
		[AceticAcid])
	(pname "Αποθήκη 2")
	(Wells [Freatio2]))

([Apothiki3] of  Store

	(Chemicals
		[RubidiumHydroxide]
		[TransformerOil])
	(pname "Αποθήκη 3")
	(Wells [Freatio3]))

([Apothiki4] of  Store

	(Chemicals
		[CarbonicAcid]
		[AceticAcid]
		[Petrol])
	(pname "Αποθήκη 4")
	(Wells [Freatio4]))

([Apothiki5] of  Store

	(Chemicals
		[Chromogen23]
		[SulphuricAcid]
		[Petrol])
	(pname "Αποθήκη 5")
	(Wells [Freatio5]))

([Apothiki6] of  Store

	(Chemicals
		[AluminiumHydroxide]
		[TransformerOil]
		[CarbonicAcid])
	(pname "Αποθήκη 6")
	(Wells [Freatio6]))

([Apothiki7] of  Store

	(Chemicals
		[SulphuricAcid]
		[HydrochloricAcid])
	(pname "Αποθήκη 7")
	(Wells [Freatio7]))

([Apothiki8] of  Store

	(Chemicals
		[CarbonicAcid]
		[AceticAcid]
		[SodiumHydroxide])
	(pname "Αποθήκη 8")
	(Wells [Freatio]))

([SulphuricAcid] of  StrongAcid

	(burnSkin TRUE)
	(causesAsphyxiation FALSE)
	(chemicalSymbolism "H2SO4")
	(color NoneColor)
	(corrosive TRUE)
	(englishName "Sulphuric acid")
	(greekName "Θειικό οξύ")
	(nonSolubility FALSE)
	(pH 2.75)
	(radioactivity FALSE)
	(smell NoneSmell)
	(specificGravity 1.0)
	(spectroscopy Sulphur))

)