<?php

namespace App\Controller;

use App\Entity\Invoice;
use App\Entity\InvoiceLines;
use App\Form\InvoiceFormType;
use App\Form\InvoiceLinesFormType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Twig\Environment;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;

class InvoiceController extends AbstractController
{
    #[Route('/invoice', name: 'app_invoice')]
    public function index(Environment $twig, ManagerRegistry $doctrine, Request $request): Response
    {
        $invoice = new Invoice();
        $invoieLines = new InvoiceLines();
        $items = ['invoice' => $invoice, 'invoiceLines' => $invoieLines];
        // $formBuilder = $this->createFormBuilder($data,$options);
        $formBuilder = $this->createFormBuilder($items);

        $formBuilder
            ->add('invoice', InvoiceFormType::class)
            ->add('invoiceLines', InvoiceLinesFormType::class)
            ->add('Ajouter', SubmitType::class);

        $form = $formBuilder->getForm();
        $form->handleRequest($request);

        if ($request->isMethod('POST')) {
            // print("Test");


            if ($form->isSubmitted() && $form->isValid()) {
                // print("Je test");

                // data is an array with "name", "email", and "message" keys
                $invoice = $form->getData()['invoice'];
                $invoice->setDate(new \DateTime());
                $invoieLines = $form->getData()['invoiceLines'];

                // $em = $this->getDoctrine()->getManager();
                // print 'Ça marche ....';
                $em =  $doctrine->getManager();
                $em->persist($invoice);

                $em->flush();

                $invoieLines->setInvoice($invoice);
                $total = $invoieLines->getAmount()*$invoieLines->getQuantity()*$invoieLines->getVat();
                $invoieLines->setTotalVat($total);
                $em->persist($invoieLines);
                $em->flush();

                // print 'OUi !!!';
                return new Response('Invoice added successfuly');
            }
       
        }


        return $this->render('invoice/show.html.twig', [
            'form' => $form->createView()
        ]);
        // return $this->json([
        //     'message' => 'Welcome to your new controller!',
        //     'path' => 'src/Controller/InvoiceController.php',
        // ]);
    }
}
