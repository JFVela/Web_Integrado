<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<style type="text/css">
.titulo1 {
	font-size: 75px;
	color: yellow;
	font-weight: bold;
	font-style: italic;
	-webkit-text-stroke: 2px black;
}

.list-group-item {
	border-color: orange;
	border-width: 3px;
	font-size: 30px;
}

h5 {
	text-align: center;
}

.card {
	border-color: graytext;
	border-width: 3px;
}

.card-title {
	font-weight: bold;
}

.btn-warning {
	border-radius: 5px;
}

.modal-header {
	color: #fff;
	background: #428bca;
	display: flex;
	justify-content: center;
}

.modal-title {
	font-weight: bold;
}

.modal-body {
	text-align: justify;
}

.btn-outline-danger {
	border-radius: 5px;
}

.titulofinal {
	color: aqua;
	font-weight: bold;
	font-style: italic;
	-webkit-text-stroke: 2px black;
}
</style>
<link rel="stylesheet" href="assets/css/menu.css">

<title>Historias de Exito</title>
</head>
<body>

	<!-- Navbar -->
	<jsp:include page="nabvar.jsp"></jsp:include>
	<!-- Navbar -->

	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="false">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/manos.jpg" class="d-block w-100">
				<div class="carousel-caption d-none d-md-block"
					style="color: #FF5733; font-style: italic;">
					<h5 style="color: #009688; font-weight: bold;">��nete a
						nosotros y juntos haremos la diferencia!</h5>
					<p style="color: #FF5733; font-weight: bold;">"Tu donaci�n
						puede ser la chispa que encienda un cambio transformador en el
						mundo"</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/disca.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block"
					style="color: #00aae4; font-style: italic;">
					<h5 style="font-weight: bold;">Tu apoyo hace esto posible</h5>
					<p style="color: #FF5733; font-weight: bold;">"Recuerda, no
						estamos recolectando donaciones, estamos construyendo
						oportunidades y cambiando vidas"</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/coramano.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block"
					style="color: #FFFFFF; font-style: italic;">
					<h5 style="font-weight: bold;">El cambio comienza con una
						acci�n</h5>
					<p style="color: #000000; font-weight: bold;">"No necesitas ser
						rico para hacer la diferencia. Tu donaci�n, por peque�a que sea,
						es un paso hacia un mundo m�s compasivo."</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-12 col-md-8">
				<h1 class="titulo1" align="center">Nuestras Historias de �xito</h1>

				<ul class="list-group">
					<li class="list-group-item">Con Responsabilidad</li>
					<li class="list-group-item">Con Respeto</li>
					<li class="list-group-item">Con Solidaridad</li>
					<li class="list-group-item">Con Amor</li>
					<li class="list-group-item">Sin algo a cambio</li>
				</ul>
			</div>
		</div>

		<div class="row">
			<div class="col-12 col-md-4 mt-5">
				<div class="card">
					<img src="img/v-DonManuel.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">La uni�n hace la Fuerza</h5>
						<p class="card-text">Don Manuel, un humilde trabajador de
							Lima, se encontraba en una situaci�n desesperada despu�s de
							sufrir una lesi�n grave en su espalda.</p>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-warning"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop">
							Leer mas...</button>

						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title fs-5" id="staticBackdropLabel">La
											uni�n hace la Fuerza</h5>
									</div>
									<div class="modal-body">Don Manuel, un humilde trabajador
										de Lima, se encontraba en una situaci�n desesperada despu�s de
										sufrir una lesi�n grave en su espalda que lo dej� postrado en
										cama. Sus sue�os de volver a caminar y trabajar para mantener
										a su familia parec�an inalcanzables. Sin embargo, la
										solidaridad de su comunidad y la generosidad de muchas
										personas de buen coraz�n permitieron que don Manuel comenzara
										su camino hacia la recuperaci�n. Gracias a las donaciones que
										se realizaron, pudo acceder a tratamientos m�dicos
										especializados, terapia f�sica y equipos de rehabilitaci�n. A
										lo largo de meses de esfuerzo y perseverancia, su fuerza de
										voluntad y el apoyo de la comunidad lo llevaron a una
										sorprendente recuperaci�n. Hoy, don Manuel camina nuevamente y
										ha retomado su trabajo para mantener a su amada familia,
										demostrando que la uni�n y la empat�a pueden hacer posibles
										milagros en la vida de las personas. Su historia inspira a
										todos a creer en la bondad y el poder de la solidaridad en el
										coraz�n peruano.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-danger"
											data-bs-dismiss="modal">Cerrar</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="col-12 col-md-4 mt-5">
				<div class="card">
					<img src="img/v-Erickson.jpeg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">No hay Excusas!!</h5>
						<p class="card-text">Erickson, un joven con autismo lleno de
							creatividad y determinaci�n, encontr� su camino hacia el �xito
							gracias a los talleres ofrecidos a nuestra ONG.</p>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-warning"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
							Leer mas...</button>

						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop1"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="staticBackdropLabel">No
											hay Excusas!!</h1>
									</div>
									<div class="modal-body">Erickson, un joven con autismo
										lleno de creatividad y determinaci�n, encontr� su camino hacia
										el �xito gracias a los talleres ofrecidos por nuestra ONG.
										Inicialmente enfrentando desaf�os en su comunicaci�n y
										socializaci�n, Erickson descubri� en estos talleres una forma
										de expresarse y conectarse con el mundo que lo rodea. Con la
										gu�a y el apoyo de los voluntarios, aprendi� a transformar
										materiales reciclados en hermosos productos artesanales. Su
										dedicaci�n y habilidades pronto lo llevaron a convertirse en
										un talentoso artesano, creando piezas �nicas que capturan la
										esencia del reciclaje creativo. Hoy, Erickson no solo ha
										superado obst�culos que parec�an insuperables, sino que
										tambi�n ha logrado independencia econ�mica a trav�s de la
										venta de sus creaciones, demostrando que el esp�ritu humano y
										la inclusi�n pueden impulsar historias de �xito excepcionales.
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-danger"
											data-bs-dismiss="modal">Cerrar</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="col-12 col-md-4 mt-5">
				<div class="card">
					<img src="img/v-Laura.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">T� pones tus propios L�mites</h5>
						<p class="card-text">Laura perdi� la vista a una edad temprana
							debido a una enfermedad gen�tica. A pesar de su ceguera, nunca
							renunci� a su amor por la m�sica.</p>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-warning"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
							Leer mas...</button>

						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop2"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="staticBackdropLabel">T�
											pones tus propios L�mites</h1>
									</div>
									<div class="modal-body">Laura perdi� la vista a una edad
										temprana debido a una enfermedad gen�tica. A pesar de su
										ceguera, nunca renunci� a su amor por la m�sica. Con paciencia
										y determinaci�n, aprendi� a tocar el piano de o�do y memoriz�
										partituras en braille. Gracias al apoyo inquebrantable de su
										familia y a las generosas donaciones de Nuestra ONG, que le
										proporcion� un piano especializado y la oportunidad de asistir
										a talleres de m�sica adaptativa, Laura, una persona de bajos
										recursos en Lima, pudo perfeccionar sus habilidades musicales.
										Los talleres le permitieron explorar nuevas t�cnicas y estilos
										musicales. Hoy, es una pianista talentosa y ha realizado
										conciertos en todo el mundo, demostrando que la m�sica es
										universal y puede ser apreciada de muchas maneras diferentes.
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-danger"
											data-bs-dismiss="modal">Cerrar</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="col-12 col-md-4 mt-5">
				<div class="card">
					<img src="img/v-Carlos.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Un Gran Orador</h5>
						<p class="card-text">Desde su infancia, Carlos luch� contra la
							tartamudez, pero nunca dej� que eso lo limitara.</p>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-warning"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop3">
							Leer mas...</button>

						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop3"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="staticBackdropLabel">Un
											Gran Orador</h1>
									</div>
									<div class="modal-body">Desde su infancia, Carlos luch�
										contra la tartamudez, pero nunca dej� que eso lo limitara. Con
										el apoyo constante de terapeutas del habla, el amoroso
										respaldo de su familia y las generosas donaciones de Nuestra
										ONG dedicada a la comunicaci�n inclusiva, Carlos, una persona
										de bajos recursos en Lima, comenz� a dar discursos en p�blico.
										Los talleres de oratoria proporcionados por Nuestra ONG le
										brindaron t�cnicas efectivas para superar sus dificultades. Su
										historia de superaci�n y perseverancia lo convirti� en un
										orador motivacional reconocido, inspirando a otros a enfrentar
										sus miedos y alcanzar sus metas, sin importar las dificultades
										que encuentren en el camino.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-danger"
											data-bs-dismiss="modal">Cerrar</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="col-12 col-md-4 mt-5">
				<div class="card">
					<img src="img/v-Isabel.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Ella baila y nada lo impide</h5>
						<p class="card-text">Isabel sufri� un accidente que la dej�
							con dificultades para caminar y necesit� una silla de ruedas para
							desplazarse.</p>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-warning"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop4">
							Leer mas...</button>

						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop4"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="staticBackdropLabel">Ella
											baila y nada lo impide</h1>
									</div>
									<div class="modal-body">Isabel sufri� un accidente que la
										dej� con dificultades para caminar y necesit� una silla de
										ruedas para desplazarse. Sin embargo, su pasi�n por la danza
										nunca se desvaneci�. Con el apoyo emocional y financiero de su
										familia y las donaciones sustanciales de Nuestra ONG dedicada
										a la danza inclusiva, Isabel, una persona de bajos recursos en
										Lima, encontr� una manera de expresarse y conectar con otros
										amantes de la danza. Los talleres de danza adaptativa
										proporcionados por Nuestra ONG enriquecieron su experiencia
										art�stica, permiti�ndole desarrollar coreograf�as innovadoras
										que desaf�an las expectativas. Hoy, es una core�grafa
										destacada en el mundo de la danza adaptativa y ha demostrado
										que el arte no conoce l�mites f�sicos.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-danger"
											data-bs-dismiss="modal">Cerrar</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="col-12 col-md-4 mt-5">
				<div class="card">
					<img src="img/v-David.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">El arte de Pintar</h5>
						<p class="card-text">A pesar de nacer con discapacidad
							auditiva, David siempre tuvo un profundo amor por la pintura.</p>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-warning"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop5">
							Leer mas...</button>

						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop5"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="staticBackdropLabel">El
											arte de Pintar</h1>
									</div>
									<div class="modal-body">A pesar de nacer con discapacidad
										auditiva, David siempre tuvo un profundo amor por la pintura.
										Utilizando colores vibrantes y texturas t�ctiles, cre� una
										forma �nica de arte que habla directamente a las emociones.
										Con el apoyo incondicional de su familia y las sustanciales
										donaciones de Nuestra ONG, que proporcion� materiales
										art�sticos de alta calidad y oportunidades para asistir a
										talleres de arte inclusivo, David, una persona de bajos
										recursos en Lima, pudo desarrollar su talento art�stico. Los
										talleres le brindaron la oportunidad de experimentar con
										nuevas t�cnicas y estilos, lo que ampli� su creatividad. Sus
										obras han sido exhibidas en galer�as de renombre y su historia
										inspira a otros a perseguir su pasi�n, independientemente de
										las barreras que puedan enfrentar.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-danger"
											data-bs-dismiss="modal">Cerrar</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col-12 col-md-9">
				<h2 class="titulofinal">GRACIAS TOTALES POR SU APOYO</h2>
				<p>El �xito y la misi�n de nuestra ONG no ser�an posibles sin el
					apoyo inquebrantable de personas como ustedes, que creen en la
					importancia de la inclusi�n y el respeto a la dignidad de todas las
					personas.</p>
				<p>A medida que continuamos trabajando incansablemente para
					empoderar a quienes enfrentan desaf�os f�sicos y emocionales, as�
					como para brindar comodidad y cari�o a nuestros adultos mayores,
					queremos que sepan cu�n valiosos son para nosotros.</p>
				<p>Su generosidad es una luz brillante en nuestro camino y una
					fuente constante de inspiraci�n.</p>
			</div>
			<div class="col-12 col-md-3 mt-5 mt-md-0">
				<img
					src="https://i0.wp.com/serranojaimeconsultores.com/wp-content/uploads/2018/03/ong-2.jpg?resize=1024%2C682&ssl=1"
					class="img-fluid rounded-top">
			</div>
		</div>

	</div>

	<!-- Footer -->
	<footer class="footer-area footer--light">
		<div class="footer-big">
			<!-- start .container -->
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="footer-widget">
							<div class="widget-about">
								<img src="assets/img/footerimg.jpg" alt="" class="img-fluid">
								<p id="footerp">Organizaci�n sin fines de lucro creada para
									ayudar a los m�s neceesitados del Per�</p>
								<ul class="contact-details">
									<li id="footerli"><span class="icon-earphones"></span>
										Telef: <a id="footera" href="tel:344-755-111">344-755-111</a>
									</li>
									<li id="footerli"><span class="icon-envelope-open"></span>
										<a id="footera" href="">51, San Mart�n 15108</a></li>
								</ul>
							</div>
						</div>
						<!-- Ends: .footer-widget -->
					</div>
					<!-- end /.col-md-4 -->
					<div class="col-md-3 col-sm-4">
						<div class="footer-widget">
							<div class="footer-menu footer-menu--1">
								<h4 id="footerh4" class="footer-widget-title">Categotoria
									popular</h4>
								<ul id="footerul">
									<li id="footerli"><a id="footera" href="voluntariado.jsp">Voluntariado</a>
									</li>
									<li id="footerli"><a id="footera" href="Donacion.jsp">Donar</a>
									</li>
									<li id="footerli"><a id="footera"
										href="voluntariado.jsp#howvol">�C�mo ser voluntario?</a></li>
									<li id="footerli"><a id="footera" href="#">Admin</a></li>
								</ul>
							</div>
							<!-- end /.footer-menu -->
						</div>
						<!-- Ends: .footer-widget -->
					</div>
					<!-- end /.col-md-3 -->

					<div class="col-md-3 col-sm-4">
						<div class="footer-widget">
							<div class="footer-menu">
								<h4 id="footerh4" class="footer-widget-title">ONG</h4>
								<ul id="footerul">
									<li id="footerli"><a id="footera" href="Nosotros.jsp">Nosotros</a>
									</li>
									<li id="footerli"><a id="footera" href="HisExito.jsp">Historias
											de �xito </a></li>
									<li id="footerli"><a id="footera" href="voluntariado.jsp">Voluntariado</a>
									</li>
									<li id="footerli"><a id="footera" href="#">Cont�ctanos</a>
									</li>
									<li id="footerli"><a id="footera" href="#">Eventos
											&amp; Noticiaas</a></li>
								</ul>
							</div>
							<!-- end /.footer-menu -->
						</div>
						<!-- Ends: .footer-widget -->
					</div>
					<!-- end /.col-lg-3 -->

					<div class="col-md-3 col-sm-4">
						<div class="footer-widget">
							<div class="footer-menu no-padding">
								<h4 id="footerh4" class="footer-widget-title">Soporte de
									ayuda</h4>
								<ul id="footerul">
									<li id="footerli"><a id="footera" href="#">Foro de
											soporte</a></li>
									<li id="footerli"><a id="footera" href="#">Terminos
											&amp; Condiciones</a></li>
									<li id="footerli"><a id="footera" href="#">Politica de
											privacidad</a></li>
									<li id="footerli"><a id="footera"
										href="voluntariado.jsp#fa1">FAQ voluntariado</a></li>
									<li id="footerli"><a id="footera" href="#">FAQ Donar</a></li>
									<li id="footerli"><a id="footera" href="#">FAQ
											Nosotros</a></li>
								</ul>
							</div>
							<!-- end /.footer-menu -->
						</div>
						<!-- Ends: .footer-widget -->
					</div>
					<!-- Ends: .col-lg-3 -->

				</div>
				<!-- end /.row -->
			</div>
			<!-- end /.container -->
		</div>
		<!-- end /.footer-big -->

		<div class="mini-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="copyright-text">
							<p id="footerp">
								� 2023 <a id="footera" href="#">Renovando Vidas</a>. Todos los
								derechos reservados. Creado por <a id="footera" href="#">J.Jos�,
									Juan, Diego, Alex</a>
							</p>
						</div>


					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Fin del Footer -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Agregar los scripts de JavaScript de Bootstrap -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>