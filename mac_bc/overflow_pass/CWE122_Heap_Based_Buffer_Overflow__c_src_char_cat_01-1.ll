; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_bad() #0 !dbg !14 {
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
  %1 = load i8*, i8** %data, align 8, !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !29
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !29
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !29
  %4 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !38
  %6 = load i8*, i8** %data, align 8, !dbg !38
  %call2 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef 50) #9, !dbg !38
  %7 = load i8*, i8** %data, align 8, !dbg !39
  call void @printLine(i8* noundef %7), !dbg !40
  %8 = load i8*, i8** %data, align 8, !dbg !41
  call void @free(i8* noundef %8), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #4

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* noundef null), !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 noundef %conv), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_good(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_bad(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !69
  store i8* %call, i8** %data, align 8, !dbg !70
  %0 = load i8*, i8** %data, align 8, !dbg !71
  %cmp = icmp eq i8* %0, null, !dbg !73
  br i1 %cmp, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !77
  %2 = load i8*, i8** %data, align 8, !dbg !77
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !77
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !77
  %4 = load i8*, i8** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !80, metadata !DIExpression()), !dbg !82
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !82
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !83
  %6 = load i8*, i8** %data, align 8, !dbg !83
  %call2 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef 50) #9, !dbg !83
  %7 = load i8*, i8** %data, align 8, !dbg !84
  call void @printLine(i8* noundef %7), !dbg !85
  %8 = load i8*, i8** %data, align 8, !dbg !86
  call void @free(i8* noundef %8), !dbg !87
  ret void, !dbg !88
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!29 = !DILocation(line: 29, column: 5, scope: !14)
!30 = !DILocation(line: 30, column: 5, scope: !14)
!31 = !DILocation(line: 30, column: 17, scope: !14)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !15, line: 32, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 32, column: 14, scope: !33)
!38 = !DILocation(line: 34, column: 9, scope: !33)
!39 = !DILocation(line: 35, column: 19, scope: !33)
!40 = !DILocation(line: 35, column: 9, scope: !33)
!41 = !DILocation(line: 36, column: 14, scope: !33)
!42 = !DILocation(line: 36, column: 9, scope: !33)
!43 = !DILocation(line: 38, column: 1, scope: !14)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_01_good", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!45 = !DILocation(line: 64, column: 5, scope: !44)
!46 = !DILocation(line: 65, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 77, type: !48, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !15, line: 77, type: !50)
!53 = !DILocation(line: 77, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !15, line: 77, type: !51)
!55 = !DILocation(line: 77, column: 27, scope: !47)
!56 = !DILocation(line: 80, column: 22, scope: !47)
!57 = !DILocation(line: 80, column: 12, scope: !47)
!58 = !DILocation(line: 80, column: 5, scope: !47)
!59 = !DILocation(line: 82, column: 5, scope: !47)
!60 = !DILocation(line: 83, column: 5, scope: !47)
!61 = !DILocation(line: 84, column: 5, scope: !47)
!62 = !DILocation(line: 87, column: 5, scope: !47)
!63 = !DILocation(line: 88, column: 5, scope: !47)
!64 = !DILocation(line: 89, column: 5, scope: !47)
!65 = !DILocation(line: 91, column: 5, scope: !47)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 45, type: !16, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!67 = !DILocalVariable(name: "data", scope: !66, file: !15, line: 47, type: !3)
!68 = !DILocation(line: 47, column: 12, scope: !66)
!69 = !DILocation(line: 48, column: 20, scope: !66)
!70 = !DILocation(line: 48, column: 10, scope: !66)
!71 = !DILocation(line: 49, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !66, file: !15, line: 49, column: 9)
!73 = !DILocation(line: 49, column: 14, scope: !72)
!74 = !DILocation(line: 49, column: 9, scope: !66)
!75 = !DILocation(line: 49, column: 24, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 49, column: 23)
!77 = !DILocation(line: 51, column: 5, scope: !66)
!78 = !DILocation(line: 52, column: 5, scope: !66)
!79 = !DILocation(line: 52, column: 16, scope: !66)
!80 = !DILocalVariable(name: "dest", scope: !81, file: !15, line: 54, type: !34)
!81 = distinct !DILexicalBlock(scope: !66, file: !15, line: 53, column: 5)
!82 = !DILocation(line: 54, column: 14, scope: !81)
!83 = !DILocation(line: 56, column: 9, scope: !81)
!84 = !DILocation(line: 57, column: 19, scope: !81)
!85 = !DILocation(line: 57, column: 9, scope: !81)
!86 = !DILocation(line: 58, column: 14, scope: !81)
!87 = !DILocation(line: 58, column: 9, scope: !81)
!88 = !DILocation(line: 60, column: 1, scope: !66)
