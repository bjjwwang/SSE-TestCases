; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  %0 = load i8*, i8** %data, align 8, !dbg !24
  %cmp = icmp eq i8* %0, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx1, align 1, !dbg !40
  %2 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !41
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !41
  %call3 = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay2, i64 noundef %4) #9, !dbg !41
  %5 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* noundef %5), !dbg !43
  %6 = load i8*, i8** %data, align 8, !dbg !44
  call void @free(i8* noundef %6), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i8* null, i8** %data, align 8, !dbg !72
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !73
  store i8* %call, i8** %data, align 8, !dbg !74
  %0 = load i8*, i8** %data, align 8, !dbg !75
  %cmp = icmp eq i8* %0, null, !dbg !77
  br i1 %cmp, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !86
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !87
  store i8 0, i8* %arrayidx1, align 1, !dbg !88
  %2 = load i8*, i8** %data, align 8, !dbg !89
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !89
  %3 = load i8*, i8** %data, align 8, !dbg !89
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !89
  %call3 = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay2, i64 noundef %4) #9, !dbg !89
  %5 = load i8*, i8** %data, align 8, !dbg !90
  call void @printLine(i8* noundef %5), !dbg !91
  %6 = load i8*, i8** %data, align 8, !dbg !92
  call void @free(i8* noundef %6), !dbg !93
  ret void, !dbg !94
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 28, column: 20, scope: !14)
!23 = !DILocation(line: 28, column: 10, scope: !14)
!24 = !DILocation(line: 29, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!26 = !DILocation(line: 29, column: 14, scope: !25)
!27 = !DILocation(line: 29, column: 9, scope: !14)
!28 = !DILocation(line: 29, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 29, column: 23)
!30 = !DILocation(line: 30, column: 5, scope: !14)
!31 = !DILocation(line: 30, column: 13, scope: !14)
!32 = !DILocalVariable(name: "source", scope: !33, file: !15, line: 32, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 32, column: 14, scope: !33)
!38 = !DILocation(line: 33, column: 9, scope: !33)
!39 = !DILocation(line: 34, column: 9, scope: !33)
!40 = !DILocation(line: 34, column: 23, scope: !33)
!41 = !DILocation(line: 36, column: 9, scope: !33)
!42 = !DILocation(line: 37, column: 19, scope: !33)
!43 = !DILocation(line: 37, column: 9, scope: !33)
!44 = !DILocation(line: 38, column: 14, scope: !33)
!45 = !DILocation(line: 38, column: 9, scope: !33)
!46 = !DILocation(line: 40, column: 1, scope: !14)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_good", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!48 = !DILocation(line: 68, column: 5, scope: !47)
!49 = !DILocation(line: 69, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 81, type: !51, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !15, line: 81, type: !53)
!56 = !DILocation(line: 81, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !15, line: 81, type: !54)
!58 = !DILocation(line: 81, column: 27, scope: !50)
!59 = !DILocation(line: 84, column: 22, scope: !50)
!60 = !DILocation(line: 84, column: 12, scope: !50)
!61 = !DILocation(line: 84, column: 5, scope: !50)
!62 = !DILocation(line: 86, column: 5, scope: !50)
!63 = !DILocation(line: 87, column: 5, scope: !50)
!64 = !DILocation(line: 88, column: 5, scope: !50)
!65 = !DILocation(line: 91, column: 5, scope: !50)
!66 = !DILocation(line: 92, column: 5, scope: !50)
!67 = !DILocation(line: 93, column: 5, scope: !50)
!68 = !DILocation(line: 95, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 47, type: !16, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!70 = !DILocalVariable(name: "data", scope: !69, file: !15, line: 49, type: !3)
!71 = !DILocation(line: 49, column: 12, scope: !69)
!72 = !DILocation(line: 50, column: 10, scope: !69)
!73 = !DILocation(line: 52, column: 20, scope: !69)
!74 = !DILocation(line: 52, column: 10, scope: !69)
!75 = !DILocation(line: 53, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !69, file: !15, line: 53, column: 9)
!77 = !DILocation(line: 53, column: 14, scope: !76)
!78 = !DILocation(line: 53, column: 9, scope: !69)
!79 = !DILocation(line: 53, column: 24, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 53, column: 23)
!81 = !DILocation(line: 54, column: 5, scope: !69)
!82 = !DILocation(line: 54, column: 13, scope: !69)
!83 = !DILocalVariable(name: "source", scope: !84, file: !15, line: 56, type: !34)
!84 = distinct !DILexicalBlock(scope: !69, file: !15, line: 55, column: 5)
!85 = !DILocation(line: 56, column: 14, scope: !84)
!86 = !DILocation(line: 57, column: 9, scope: !84)
!87 = !DILocation(line: 58, column: 9, scope: !84)
!88 = !DILocation(line: 58, column: 23, scope: !84)
!89 = !DILocation(line: 60, column: 9, scope: !84)
!90 = !DILocation(line: 61, column: 19, scope: !84)
!91 = !DILocation(line: 61, column: 9, scope: !84)
!92 = !DILocation(line: 62, column: 14, scope: !84)
!93 = !DILocation(line: 62, column: 9, scope: !84)
!94 = !DILocation(line: 64, column: 1, scope: !69)
