; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !31
  %0 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !36
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !37
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !37
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !37
  %add = add i64 %call, 1, !dbg !37
  %mul = mul i64 %add, 1, !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !37
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !37
  %call3 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %4) #5, !dbg !37
  %5 = load i8*, i8** %data, align 8, !dbg !38
  call void @printLine(i8* noundef %5), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* noundef null), !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 noundef %conv), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01_good(), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01_bad(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !70
  store i8* %arraydecay, i8** %data, align 8, !dbg !71
  %0 = load i8*, i8** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !74, metadata !DIExpression()), !dbg !76
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !76
  %2 = load i8*, i8** %data, align 8, !dbg !77
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !77
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !77
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !77
  %add = add i64 %call, 1, !dbg !77
  %mul = mul i64 %add, 1, !dbg !77
  %3 = load i8*, i8** %data, align 8, !dbg !77
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !77
  %call3 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %4) #5, !dbg !77
  %5 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* noundef %5), !dbg !79
  ret void, !dbg !80
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 30, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 80, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 10)
!24 = !DILocation(line: 31, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 32, column: 10, scope: !11)
!30 = !DILocation(line: 35, column: 12, scope: !11)
!31 = !DILocation(line: 35, column: 10, scope: !11)
!32 = !DILocation(line: 36, column: 5, scope: !11)
!33 = !DILocation(line: 36, column: 13, scope: !11)
!34 = !DILocalVariable(name: "source", scope: !35, file: !12, line: 38, type: !26)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!36 = !DILocation(line: 38, column: 14, scope: !35)
!37 = !DILocation(line: 41, column: 9, scope: !35)
!38 = !DILocation(line: 42, column: 19, scope: !35)
!39 = !DILocation(line: 42, column: 9, scope: !35)
!40 = !DILocation(line: 44, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_01_good", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!42 = !DILocation(line: 71, column: 5, scope: !41)
!43 = !DILocation(line: 72, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 84, type: !45, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !12, line: 84, type: !47)
!50 = !DILocation(line: 84, column: 14, scope: !44)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !12, line: 84, type: !48)
!52 = !DILocation(line: 84, column: 27, scope: !44)
!53 = !DILocation(line: 87, column: 22, scope: !44)
!54 = !DILocation(line: 87, column: 12, scope: !44)
!55 = !DILocation(line: 87, column: 5, scope: !44)
!56 = !DILocation(line: 89, column: 5, scope: !44)
!57 = !DILocation(line: 90, column: 5, scope: !44)
!58 = !DILocation(line: 91, column: 5, scope: !44)
!59 = !DILocation(line: 94, column: 5, scope: !44)
!60 = !DILocation(line: 95, column: 5, scope: !44)
!61 = !DILocation(line: 96, column: 5, scope: !44)
!62 = !DILocation(line: 98, column: 5, scope: !44)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!64 = !DILocalVariable(name: "data", scope: !63, file: !12, line: 53, type: !17)
!65 = !DILocation(line: 53, column: 12, scope: !63)
!66 = !DILocalVariable(name: "dataBadBuffer", scope: !63, file: !12, line: 54, type: !21)
!67 = !DILocation(line: 54, column: 10, scope: !63)
!68 = !DILocalVariable(name: "dataGoodBuffer", scope: !63, file: !12, line: 55, type: !26)
!69 = !DILocation(line: 55, column: 10, scope: !63)
!70 = !DILocation(line: 58, column: 12, scope: !63)
!71 = !DILocation(line: 58, column: 10, scope: !63)
!72 = !DILocation(line: 59, column: 5, scope: !63)
!73 = !DILocation(line: 59, column: 13, scope: !63)
!74 = !DILocalVariable(name: "source", scope: !75, file: !12, line: 61, type: !26)
!75 = distinct !DILexicalBlock(scope: !63, file: !12, line: 60, column: 5)
!76 = !DILocation(line: 61, column: 14, scope: !75)
!77 = !DILocation(line: 64, column: 9, scope: !75)
!78 = !DILocation(line: 65, column: 19, scope: !75)
!79 = !DILocation(line: 65, column: 9, scope: !75)
!80 = !DILocation(line: 67, column: 1, scope: !63)
