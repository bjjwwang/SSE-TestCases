; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/general/ArrayIndex_WronglyValidate_OOB_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/ArrayIndex_WronglyValidate_OOB_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%struct.IVP_DEV = type { i32, [16 x [8 x i8]] }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@__stdinp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @printSect(i32 noundef %index, %struct.IVP_DEV* noundef %ivp_dev) #0 !dbg !23 {
entry:
  %index.addr = alloca i32, align 4
  %ivp_dev.addr = alloca %struct.IVP_DEV*, align 8
  store i32 %index, i32* %index.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %index.addr, metadata !27, metadata !DIExpression()), !dbg !28
  store %struct.IVP_DEV* %ivp_dev, %struct.IVP_DEV** %ivp_dev.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.IVP_DEV** %ivp_dev.addr, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* %index.addr, align 4, !dbg !31
  %1 = load %struct.IVP_DEV*, %struct.IVP_DEV** %ivp_dev.addr, align 8, !dbg !33
  %sect_count = getelementptr inbounds %struct.IVP_DEV, %struct.IVP_DEV* %1, i32 0, i32 0, !dbg !34
  %2 = load i32, i32* %sect_count, align 4, !dbg !34
  %cmp = icmp sgt i32 %0, %2, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  br label %return, !dbg !37

if.end:                                           ; preds = %entry
  %3 = load %struct.IVP_DEV*, %struct.IVP_DEV** %ivp_dev.addr, align 8, !dbg !39
  %sects = getelementptr inbounds %struct.IVP_DEV, %struct.IVP_DEV* %3, i32 0, i32 1, !dbg !40
  %4 = load i32, i32* %index.addr, align 4, !dbg !41
  %idxprom = sext i32 %4 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [16 x [8 x i8]], [16 x [8 x i8]]* %sects, i64 0, i64 %idxprom, !dbg !39
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %arrayidx, i64 0, i64 0, !dbg !39
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* noundef %arraydecay), !dbg !42
  br label %return, !dbg !43

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca [2048 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [2048 x i8]* %buf, metadata !53, metadata !DIExpression()), !dbg !57
  %0 = bitcast [2048 x i8]* %buf to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 2048, i1 false), !dbg !57
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !58
  %arraydecay = getelementptr inbounds [2048 x i8], [2048 x i8]* %buf, i64 0, i64 0, !dbg !59
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* noundef %arraydecay), !dbg !60
  %arraydecay1 = getelementptr inbounds [2048 x i8], [2048 x i8]* %buf, i64 0, i64 0, !dbg !61
  %2 = bitcast i8* %arraydecay1 to %struct.IVP_DEV*, !dbg !62
  call void @printSect(i32 noundef 16, %struct.IVP_DEV* noundef %2), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/ArrayIndex_WronglyValidate_OOB_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "IVP_DEV", file: !5, line: 10, baseType: !6)
!5 = !DIFile(filename: "general/ArrayIndex_WronglyValidate_OOB_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "IVP_DEV", file: !5, line: 7, size: 1056, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "sect_count", scope: !6, file: !5, line: 8, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "sects", scope: !6, file: !5, line: 9, baseType: !11, size: 1024, offset: 32)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1024, elements: !13)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{!14, !15}
!14 = !DISubrange(count: 16)
!15 = !DISubrange(count: 8)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "printSect", scope: !5, file: !5, line: 15, type: !24, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !9, !3}
!26 = !{}
!27 = !DILocalVariable(name: "index", arg: 1, scope: !23, file: !5, line: 15, type: !9)
!28 = !DILocation(line: 15, column: 20, scope: !23)
!29 = !DILocalVariable(name: "ivp_dev", arg: 2, scope: !23, file: !5, line: 15, type: !3)
!30 = !DILocation(line: 15, column: 36, scope: !23)
!31 = !DILocation(line: 18, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !23, file: !5, line: 18, column: 9)
!33 = !DILocation(line: 18, column: 17, scope: !32)
!34 = !DILocation(line: 18, column: 26, scope: !32)
!35 = !DILocation(line: 18, column: 15, scope: !32)
!36 = !DILocation(line: 18, column: 9, scope: !23)
!37 = !DILocation(line: 19, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !5, line: 18, column: 38)
!39 = !DILocation(line: 23, column: 20, scope: !23)
!40 = !DILocation(line: 23, column: 29, scope: !23)
!41 = !DILocation(line: 23, column: 35, scope: !23)
!42 = !DILocation(line: 23, column: 5, scope: !23)
!43 = !DILocation(line: 24, column: 1, scope: !23)
!44 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 25, type: !45, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !26)
!45 = !DISubroutineType(types: !46)
!46 = !{!9, !9, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !5, line: 25, type: !9)
!50 = !DILocation(line: 25, column: 14, scope: !44)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !5, line: 25, type: !47)
!52 = !DILocation(line: 25, column: 27, scope: !44)
!53 = !DILocalVariable(name: "buf", scope: !44, file: !5, line: 28, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 16384, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 2048)
!57 = !DILocation(line: 28, column: 10, scope: !44)
!58 = !DILocation(line: 29, column: 12, scope: !44)
!59 = !DILocation(line: 29, column: 25, scope: !44)
!60 = !DILocation(line: 29, column: 5, scope: !44)
!61 = !DILocation(line: 30, column: 37, scope: !44)
!62 = !DILocation(line: 30, column: 26, scope: !44)
!63 = !DILocation(line: 30, column: 5, scope: !44)
!64 = !DILocation(line: 31, column: 5, scope: !44)
