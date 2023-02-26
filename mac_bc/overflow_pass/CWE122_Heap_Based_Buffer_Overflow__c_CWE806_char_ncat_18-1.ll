; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  br label %source, !dbg !29

source:                                           ; preds = %if.end
  call void @llvm.dbg.label(metadata !30), !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !32
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %6 = load i8*, i8** %data, align 8, !dbg !41
  %7 = load i8*, i8** %data, align 8, !dbg !41
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !41
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef %call2, i64 noundef 50) #9, !dbg !41
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !42
  store i8 0, i8* %arrayidx4, align 1, !dbg !43
  %8 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* noundef %8), !dbg !45
  %9 = load i8*, i8** %data, align 8, !dbg !46
  call void @free(i8* noundef %9), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* noundef null), !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 noundef %conv), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_good(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_bad(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !74
  store i8* %call, i8** %data, align 8, !dbg !75
  %0 = load i8*, i8** %data, align 8, !dbg !76
  %cmp = icmp eq i8* %0, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  br label %source, !dbg !82

source:                                           ; preds = %if.end
  call void @llvm.dbg.label(metadata !83), !dbg !84
  %1 = load i8*, i8** %data, align 8, !dbg !85
  %2 = load i8*, i8** %data, align 8, !dbg !85
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !85
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !85
  %4 = load i8*, i8** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !90
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !91
  %6 = load i8*, i8** %data, align 8, !dbg !91
  %7 = load i8*, i8** %data, align 8, !dbg !91
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !91
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef %call2, i64 noundef 50) #9, !dbg !91
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !92
  store i8 0, i8* %arrayidx4, align 1, !dbg !93
  %8 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* noundef %8), !dbg !95
  %9 = load i8*, i8** %data, align 8, !dbg !96
  call void @free(i8* noundef %9), !dbg !97
  ret void, !dbg !98
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 20, scope: !14)
!22 = !DILocation(line: 26, column: 10, scope: !14)
!23 = !DILocation(line: 27, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!25 = !DILocation(line: 27, column: 14, scope: !24)
!26 = !DILocation(line: 27, column: 9, scope: !14)
!27 = !DILocation(line: 27, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 27, column: 23)
!29 = !DILocation(line: 28, column: 5, scope: !14)
!30 = !DILabel(scope: !14, name: "source", file: !15, line: 29)
!31 = !DILocation(line: 29, column: 1, scope: !14)
!32 = !DILocation(line: 31, column: 5, scope: !14)
!33 = !DILocation(line: 32, column: 5, scope: !14)
!34 = !DILocation(line: 32, column: 17, scope: !14)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !15, line: 34, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 34, column: 14, scope: !36)
!41 = !DILocation(line: 36, column: 9, scope: !36)
!42 = !DILocation(line: 37, column: 9, scope: !36)
!43 = !DILocation(line: 37, column: 20, scope: !36)
!44 = !DILocation(line: 38, column: 19, scope: !36)
!45 = !DILocation(line: 38, column: 9, scope: !36)
!46 = !DILocation(line: 39, column: 14, scope: !36)
!47 = !DILocation(line: 39, column: 9, scope: !36)
!48 = !DILocation(line: 41, column: 1, scope: !14)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_good", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!50 = !DILocation(line: 70, column: 5, scope: !49)
!51 = !DILocation(line: 71, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 83, type: !53, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !15, line: 83, type: !55)
!58 = !DILocation(line: 83, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !15, line: 83, type: !56)
!60 = !DILocation(line: 83, column: 27, scope: !52)
!61 = !DILocation(line: 86, column: 22, scope: !52)
!62 = !DILocation(line: 86, column: 12, scope: !52)
!63 = !DILocation(line: 86, column: 5, scope: !52)
!64 = !DILocation(line: 88, column: 5, scope: !52)
!65 = !DILocation(line: 89, column: 5, scope: !52)
!66 = !DILocation(line: 90, column: 5, scope: !52)
!67 = !DILocation(line: 93, column: 5, scope: !52)
!68 = !DILocation(line: 94, column: 5, scope: !52)
!69 = !DILocation(line: 95, column: 5, scope: !52)
!70 = !DILocation(line: 97, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 48, type: !16, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!72 = !DILocalVariable(name: "data", scope: !71, file: !15, line: 50, type: !3)
!73 = !DILocation(line: 50, column: 12, scope: !71)
!74 = !DILocation(line: 51, column: 20, scope: !71)
!75 = !DILocation(line: 51, column: 10, scope: !71)
!76 = !DILocation(line: 52, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !71, file: !15, line: 52, column: 9)
!78 = !DILocation(line: 52, column: 14, scope: !77)
!79 = !DILocation(line: 52, column: 9, scope: !71)
!80 = !DILocation(line: 52, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 52, column: 23)
!82 = !DILocation(line: 53, column: 5, scope: !71)
!83 = !DILabel(scope: !71, name: "source", file: !15, line: 54)
!84 = !DILocation(line: 54, column: 1, scope: !71)
!85 = !DILocation(line: 56, column: 5, scope: !71)
!86 = !DILocation(line: 57, column: 5, scope: !71)
!87 = !DILocation(line: 57, column: 16, scope: !71)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !15, line: 59, type: !37)
!89 = distinct !DILexicalBlock(scope: !71, file: !15, line: 58, column: 5)
!90 = !DILocation(line: 59, column: 14, scope: !89)
!91 = !DILocation(line: 61, column: 9, scope: !89)
!92 = !DILocation(line: 62, column: 9, scope: !89)
!93 = !DILocation(line: 62, column: 20, scope: !89)
!94 = !DILocation(line: 63, column: 19, scope: !89)
!95 = !DILocation(line: 63, column: 9, scope: !89)
!96 = !DILocation(line: 64, column: 14, scope: !89)
!97 = !DILocation(line: 64, column: 9, scope: !89)
!98 = !DILocation(line: 66, column: 1, scope: !71)
