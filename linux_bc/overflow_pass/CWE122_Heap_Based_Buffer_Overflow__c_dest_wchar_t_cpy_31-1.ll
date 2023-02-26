; ModuleID = 'linux_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !34, metadata !DIExpression()), !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %3, i32** %dataCopy, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !38, metadata !DIExpression()), !dbg !39
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !40
  store i32* %4, i32** %data1, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx3, align 4, !dbg !50
  %5 = load i32*, i32** %data1, align 8, !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #5, !dbg !53
  %6 = load i32*, i32** %data1, align 8, !dbg !54
  call void @printWLine(i32* %6), !dbg !55
  %7 = load i32*, i32** %data1, align 8, !dbg !56
  %8 = bitcast i32* %7 to i8*, !dbg !56
  call void @free(i8* %8) #5, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !86
  %0 = bitcast i8* %call to i32*, !dbg !87
  store i32* %0, i32** %data, align 8, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %cmp = icmp eq i32* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !97, metadata !DIExpression()), !dbg !99
  %3 = load i32*, i32** %data, align 8, !dbg !100
  store i32* %3, i32** %dataCopy, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !101, metadata !DIExpression()), !dbg !102
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !103
  store i32* %4, i32** %data1, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !108
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx3, align 4, !dbg !110
  %5 = load i32*, i32** %data1, align 8, !dbg !111
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #5, !dbg !113
  %6 = load i32*, i32** %data1, align 8, !dbg !114
  call void @printWLine(i32* %6), !dbg !115
  %7 = load i32*, i32** %data1, align 8, !dbg !116
  %8 = bitcast i32* %7 to i8*, !dbg !116
  call void @free(i8* %8) #5, !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/SVF-tools")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 28, column: 23, scope: !16)
!24 = !DILocation(line: 28, column: 12, scope: !16)
!25 = !DILocation(line: 28, column: 10, scope: !16)
!26 = !DILocation(line: 29, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 9)
!28 = !DILocation(line: 29, column: 14, scope: !27)
!29 = !DILocation(line: 29, column: 9, scope: !16)
!30 = !DILocation(line: 29, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 29, column: 23)
!32 = !DILocation(line: 30, column: 5, scope: !16)
!33 = !DILocation(line: 30, column: 13, scope: !16)
!34 = !DILocalVariable(name: "dataCopy", scope: !35, file: !17, line: 32, type: !4)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 5)
!36 = !DILocation(line: 32, column: 19, scope: !35)
!37 = !DILocation(line: 32, column: 30, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !17, line: 33, type: !4)
!39 = !DILocation(line: 33, column: 19, scope: !35)
!40 = !DILocation(line: 33, column: 26, scope: !35)
!41 = !DILocalVariable(name: "source", scope: !42, file: !17, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !35, file: !17, line: 34, column: 9)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 35, column: 21, scope: !42)
!47 = !DILocation(line: 36, column: 21, scope: !42)
!48 = !DILocation(line: 36, column: 13, scope: !42)
!49 = !DILocation(line: 37, column: 13, scope: !42)
!50 = !DILocation(line: 37, column: 27, scope: !42)
!51 = !DILocation(line: 39, column: 20, scope: !42)
!52 = !DILocation(line: 39, column: 26, scope: !42)
!53 = !DILocation(line: 39, column: 13, scope: !42)
!54 = !DILocation(line: 40, column: 24, scope: !42)
!55 = !DILocation(line: 40, column: 13, scope: !42)
!56 = !DILocation(line: 41, column: 18, scope: !42)
!57 = !DILocation(line: 41, column: 13, scope: !42)
!58 = !DILocation(line: 44, column: 1, scope: !16)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_good", scope: !17, file: !17, line: 74, type: !18, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 76, column: 5, scope: !59)
!61 = !DILocation(line: 77, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 88, type: !63, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !17, line: 88, type: !7)
!69 = !DILocation(line: 88, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !17, line: 88, type: !65)
!71 = !DILocation(line: 88, column: 27, scope: !62)
!72 = !DILocation(line: 91, column: 22, scope: !62)
!73 = !DILocation(line: 91, column: 12, scope: !62)
!74 = !DILocation(line: 91, column: 5, scope: !62)
!75 = !DILocation(line: 93, column: 5, scope: !62)
!76 = !DILocation(line: 94, column: 5, scope: !62)
!77 = !DILocation(line: 95, column: 5, scope: !62)
!78 = !DILocation(line: 98, column: 5, scope: !62)
!79 = !DILocation(line: 99, column: 5, scope: !62)
!80 = !DILocation(line: 100, column: 5, scope: !62)
!81 = !DILocation(line: 102, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 51, type: !18, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !17, line: 53, type: !4)
!84 = !DILocation(line: 53, column: 15, scope: !82)
!85 = !DILocation(line: 54, column: 10, scope: !82)
!86 = !DILocation(line: 56, column: 23, scope: !82)
!87 = !DILocation(line: 56, column: 12, scope: !82)
!88 = !DILocation(line: 56, column: 10, scope: !82)
!89 = !DILocation(line: 57, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !17, line: 57, column: 9)
!91 = !DILocation(line: 57, column: 14, scope: !90)
!92 = !DILocation(line: 57, column: 9, scope: !82)
!93 = !DILocation(line: 57, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !17, line: 57, column: 23)
!95 = !DILocation(line: 58, column: 5, scope: !82)
!96 = !DILocation(line: 58, column: 13, scope: !82)
!97 = !DILocalVariable(name: "dataCopy", scope: !98, file: !17, line: 60, type: !4)
!98 = distinct !DILexicalBlock(scope: !82, file: !17, line: 59, column: 5)
!99 = !DILocation(line: 60, column: 19, scope: !98)
!100 = !DILocation(line: 60, column: 30, scope: !98)
!101 = !DILocalVariable(name: "data", scope: !98, file: !17, line: 61, type: !4)
!102 = !DILocation(line: 61, column: 19, scope: !98)
!103 = !DILocation(line: 61, column: 26, scope: !98)
!104 = !DILocalVariable(name: "source", scope: !105, file: !17, line: 63, type: !43)
!105 = distinct !DILexicalBlock(scope: !98, file: !17, line: 62, column: 9)
!106 = !DILocation(line: 63, column: 21, scope: !105)
!107 = !DILocation(line: 64, column: 21, scope: !105)
!108 = !DILocation(line: 64, column: 13, scope: !105)
!109 = !DILocation(line: 65, column: 13, scope: !105)
!110 = !DILocation(line: 65, column: 27, scope: !105)
!111 = !DILocation(line: 67, column: 20, scope: !105)
!112 = !DILocation(line: 67, column: 26, scope: !105)
!113 = !DILocation(line: 67, column: 13, scope: !105)
!114 = !DILocation(line: 68, column: 24, scope: !105)
!115 = !DILocation(line: 68, column: 13, scope: !105)
!116 = !DILocation(line: 69, column: 18, scope: !105)
!117 = !DILocation(line: 69, column: 13, scope: !105)
!118 = !DILocation(line: 72, column: 1, scope: !82)
