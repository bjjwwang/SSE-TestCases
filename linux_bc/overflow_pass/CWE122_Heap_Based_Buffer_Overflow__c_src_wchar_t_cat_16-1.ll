; ModuleID = 'linux_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  br label %while.body, !dbg !31

while.body:                                       ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %while.end, !dbg !37

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %call2 = call i32* @wcscat(i32* %arraydecay, i32* %5) #6, !dbg !46
  %6 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %6), !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  %8 = bitcast i32* %7 to i8*, !dbg !49
  call void @free(i8* %8) #6, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !78
  %0 = bitcast i8* %call to i32*, !dbg !79
  store i32* %0, i32** %data, align 8, !dbg !80
  %1 = load i32*, i32** %data, align 8, !dbg !81
  %cmp = icmp eq i32* %1, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  br label %while.body, !dbg !87

while.body:                                       ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !88
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !90
  %3 = load i32*, i32** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  br label %while.end, !dbg !93

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !97
  %5 = load i32*, i32** %data, align 8, !dbg !98
  %call2 = call i32* @wcscat(i32* %arraydecay, i32* %5) #6, !dbg !99
  %6 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* %6), !dbg !101
  %7 = load i32*, i32** %data, align 8, !dbg !102
  %8 = bitcast i32* %7 to i8*, !dbg !102
  call void @free(i8* %8) #6, !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16-1.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 28, column: 5, scope: !16)
!32 = !DILocation(line: 31, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 5)
!34 = !DILocation(line: 31, column: 9, scope: !33)
!35 = !DILocation(line: 32, column: 9, scope: !33)
!36 = !DILocation(line: 32, column: 21, scope: !33)
!37 = !DILocation(line: 33, column: 9, scope: !33)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !17, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 36, column: 17, scope: !39)
!44 = !DILocation(line: 38, column: 16, scope: !39)
!45 = !DILocation(line: 38, column: 22, scope: !39)
!46 = !DILocation(line: 38, column: 9, scope: !39)
!47 = !DILocation(line: 39, column: 20, scope: !39)
!48 = !DILocation(line: 39, column: 9, scope: !39)
!49 = !DILocation(line: 40, column: 14, scope: !39)
!50 = !DILocation(line: 40, column: 9, scope: !39)
!51 = !DILocation(line: 42, column: 1, scope: !16)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_good", scope: !17, file: !17, line: 70, type: !18, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 72, column: 5, scope: !52)
!54 = !DILocation(line: 73, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 85, type: !56, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !17, line: 85, type: !7)
!62 = !DILocation(line: 85, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !17, line: 85, type: !58)
!64 = !DILocation(line: 85, column: 27, scope: !55)
!65 = !DILocation(line: 88, column: 22, scope: !55)
!66 = !DILocation(line: 88, column: 12, scope: !55)
!67 = !DILocation(line: 88, column: 5, scope: !55)
!68 = !DILocation(line: 90, column: 5, scope: !55)
!69 = !DILocation(line: 91, column: 5, scope: !55)
!70 = !DILocation(line: 92, column: 5, scope: !55)
!71 = !DILocation(line: 95, column: 5, scope: !55)
!72 = !DILocation(line: 96, column: 5, scope: !55)
!73 = !DILocation(line: 97, column: 5, scope: !55)
!74 = !DILocation(line: 99, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 49, type: !18, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !17, line: 51, type: !4)
!77 = !DILocation(line: 51, column: 15, scope: !75)
!78 = !DILocation(line: 52, column: 23, scope: !75)
!79 = !DILocation(line: 52, column: 12, scope: !75)
!80 = !DILocation(line: 52, column: 10, scope: !75)
!81 = !DILocation(line: 53, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !17, line: 53, column: 9)
!83 = !DILocation(line: 53, column: 14, scope: !82)
!84 = !DILocation(line: 53, column: 9, scope: !75)
!85 = !DILocation(line: 53, column: 24, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !17, line: 53, column: 23)
!87 = !DILocation(line: 54, column: 5, scope: !75)
!88 = !DILocation(line: 57, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !75, file: !17, line: 55, column: 5)
!90 = !DILocation(line: 57, column: 9, scope: !89)
!91 = !DILocation(line: 58, column: 9, scope: !89)
!92 = !DILocation(line: 58, column: 20, scope: !89)
!93 = !DILocation(line: 59, column: 9, scope: !89)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !17, line: 62, type: !40)
!95 = distinct !DILexicalBlock(scope: !75, file: !17, line: 61, column: 5)
!96 = !DILocation(line: 62, column: 17, scope: !95)
!97 = !DILocation(line: 64, column: 16, scope: !95)
!98 = !DILocation(line: 64, column: 22, scope: !95)
!99 = !DILocation(line: 64, column: 9, scope: !95)
!100 = !DILocation(line: 65, column: 20, scope: !95)
!101 = !DILocation(line: 65, column: 9, scope: !95)
!102 = !DILocation(line: 66, column: 14, scope: !95)
!103 = !DILocation(line: 66, column: 9, scope: !95)
!104 = !DILocation(line: 68, column: 1, scope: !75)
